# -*- coding: utf-8 -*-

# Copyright 2022-2023 Mike Fährmann
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

"""Extractors for https://www.zerochan.net/"""

from .booru import BooruExtractor
from ..cache import cache
from .. import text, util, exception

BASE_PATTERN = r"(?:https?://)?(?:www\.)?zerochan\.net"


class ZerochanExtractor(BooruExtractor):
    """Base class for zerochan extractors"""
    category = "zerochan"
    root = "https://www.zerochan.net"
    filename_fmt = "{id}.{extension}"
    archive_fmt = "{id}"
    page_start = 1
    per_page = 250
    cookies_domain = ".zerochan.net"
    cookies_names = ("z_id", "z_hash")
    request_interval = (0.5, 1.5)

    def login(self):
        self._logged_in = True
        if self.cookies_check(self.cookies_names):
            return

        username, password = self._get_auth_info()
        if username:
            return self.cookies_update(self._login_impl(username, password))

        self._logged_in = False

    @cache(maxage=90*86400, keyarg=1)
    def _login_impl(self, username, password):
        self.log.info("Logging in as %s", username)

        url = self.root + "/login"
        headers = {
            "Origin"  : self.root,
            "Referer" : url,
        }
        data = {
            "ref"     : "/",
            "name"    : username,
            "password": password,
            "login"   : "Login",
        }

        response = self.request(url, method="POST", headers=headers, data=data)
        if not response.history:
            raise exception.AuthenticationError()

        return response.cookies

    def _parse_entry_html(self, entry_id):
        url = "{}/{}".format(self.root, entry_id)
        extr = text.extract_from(self.request(url).text)

        data = {
            "id"      : text.parse_int(entry_id),
            "author"  : text.parse_unicode_escapes(extr('    "name": "', '"')),
            "file_url": extr('"contentUrl": "', '"'),
            "date"    : text.parse_datetime(extr('"datePublished": "', '"')),
            "width"   : text.parse_int(extr('"width": "', ' ')),
            "height"  : text.parse_int(extr('"height": "', ' ')),
            "size"    : text.parse_bytes(extr('"contentSize": "', 'B')),
            "path"    : text.split_html(extr(
                'class="breadcrumbs', '</nav>'))[2:],
            "uploader": extr('href="/user/', '"'),
            "tags"    : extr('<ul id="tags"', '</ul>'),
            "source"  : extr('<h2>Source</h2>', '</p><h2>').rpartition(
                ">")[2] or None,
        }

        html = data["tags"]
        tags = data["tags"] = []
        for tag in html.split("<li class=")[1:]:
            category = text.extr(tag, 'data-type="', '"')
            name = text.extr(tag, 'data-tag="', '"')
            tags.append(category.capitalize() + ":" + name)

        return data

    def _parse_entry_api(self, entry_id):
        url = "{}/{}?json".format(self.root, entry_id)
        item = self.request(url).json()

        data = {
            "id"      : item["id"],
            "file_url": item["full"],
            "width"   : item["width"],
            "height"  : item["height"],
            "size"    : item["size"],
            "name"    : item["primary"],
            "md5"     : item["hash"],
            "source"  : item.get("source"),
        }

        if not self._logged_in:
            data["tags"] = item["tags"]

        return data


class ZerochanTagExtractor(ZerochanExtractor):
    subcategory = "tag"
    directory_fmt = ("{category}", "{search_tags}")
    pattern = BASE_PATTERN + r"/(?!\d+$)([^/?#]+)/?(?:\?([^#]+))?"
    example = "https://www.zerochan.net/TAG"

    def __init__(self, match):
        ZerochanExtractor.__init__(self, match)
        self.search_tag, self.query = match.groups()

    def _init(self):
        if self.config("pagination") == "html":
            self.posts = self.posts_html
            self.per_page = 24
        else:
            self.posts = self.posts_api
            self.session.headers["User-Agent"] = util.USERAGENT

    def metadata(self):
        return {"search_tags": text.unquote(
            self.search_tag.replace("+", " "))}

    def posts_html(self):
        url = self.root + "/" + self.search_tag
        params = text.parse_query(self.query)
        params["p"] = text.parse_int(params.get("p"), self.page_start)
        metadata = self.config("metadata")

        while True:
            page = self.request(url, params=params).text
            thumbs = text.extr(page, '<ul id="thumbs', '</ul>')
            extr = text.extract_from(thumbs)

            while True:
                post = extr('<li class="', '>')
                if not post:
                    break

                if metadata:
                    entry_id = extr('href="/', '"')
                    post = self._parse_entry_html(entry_id)
                    post.update(self._parse_entry_api(entry_id))
                    yield post
                else:
                    yield {
                        "id"    : extr('href="/', '"'),
                        "name"  : extr('alt="', '"'),
                        "width" : extr('title="', '&#10005;'),
                        "height": extr('', ' '),
                        "size"  : extr('', 'b'),
                        "file_url": "https://static." + extr(
                            '<a href="https://static.', '"'),
                    }

            if 'rel="next"' not in page:
                break
            params["p"] += 1

    def posts_api(self):
        url = self.root + "/" + self.search_tag
        metadata = self.config("metadata")
        params = {
            "json": "1",
            "l"   : self.per_page,
            "p"   : self.page_start,
        }

        static = "https://static.zerochan.net/.full."

        while True:
            data = self.request(url, params=params).json()
            try:
                posts = data["items"]
            except ValueError:
                return

            if metadata:
                for post in posts:
                    post_id = post["id"]
                    post.update(self._parse_entry_html(post_id))
                    post.update(self._parse_entry_api(post_id))
            else:
                for post in posts:
                    base = static + str(post["id"])
                    post["file_url"] = base + ".jpg"
                    post["_fallback"] = (base + ".png",)

            yield from posts

            if not data.get("next"):
                return
            params["p"] += 1


class ZerochanImageExtractor(ZerochanExtractor):
    subcategory = "image"
    pattern = BASE_PATTERN + r"/(\d+)"
    example = "https://www.zerochan.net/12345"

    def __init__(self, match):
        ZerochanExtractor.__init__(self, match)
        self.image_id = match.group(1)

    def posts(self):
        post = self._parse_entry_html(self.image_id)
        if self.config("metadata"):
            post.update(self._parse_entry_api(self.image_id))
        return (post,)
