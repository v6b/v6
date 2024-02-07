# -*- coding: utf-8 -*-

# Copyright 2022 Ailothaen
# Copyright 2024 Mike Fährmann
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

"""Extractors for Wikimedia sites"""

from .common import BaseExtractor, Message
from .. import text


class WikimediaExtractor(BaseExtractor):
    """Base class for wikimedia extractors"""
    basecategory = "wikimedia"
    filename_fmt = "{filename} ({sha1[:8]}).{extension}"
    directory_fmt = ("{category}", "{page}")
    archive_fmt = "{sha1}"
    request_interval = (1.0, 2.0)

    def __init__(self, match):
        BaseExtractor.__init__(self, match)
        path = match.group(match.lastindex)

        if self.category == "fandom":
            self.category = \
                "fandom-" + self.root.partition(".")[0].rpartition("/")[2]

        if path.startswith("wiki/"):
            path = path[5:]

        pre, sep, _ = path.partition(":")
        prefix = pre.lower() if sep else None

        self.title = path = text.unquote(path)
        if prefix:
            self.subcategory = prefix

        if prefix == "category":
            self.params = {
                "generator": "categorymembers",
                "gcmtitle" : path,
                "gcmtype"  : "file",
            }
        elif prefix == "file":
            self.params = {
                "titles"   : path,
            }
        else:
            self.params = {
                "generator": "images",
                "titles"   : path,
            }

    def _init(self):
        api_path = self.config_instance("api-path")
        if api_path:
            if api_path[0] == "/":
                self.api_url = self.root + api_path
            else:
                self.api_url = api_path
        else:
            self.api_url = self.root + "/api.php"

    def items(self):
        for info in self._pagination(self.params):
            image = info["imageinfo"][0]

            image["metadata"] = {
                m["name"]: m["value"]
                for m in image["metadata"]}
            image["commonmetadata"] = {
                m["name"]: m["value"]
                for m in image["commonmetadata"]}

            filename = image["canonicaltitle"]
            image["filename"], _, image["extension"] = \
                filename.partition(":")[2].rpartition(".")
            image["date"] = text.parse_datetime(
                image["timestamp"], "%Y-%m-%dT%H:%M:%SZ")
            image["page"] = self.title

            yield Message.Directory, image
            yield Message.Url, image["url"], image

    def _pagination(self, params):
        """
        https://www.mediawiki.org/wiki/API:Query
        https://opendata.stackexchange.com/questions/13381
        """

        url = self.api_url
        params["action"] = "query"
        params["format"] = "json"
        params["prop"] = "imageinfo"
        params["iiprop"] = (
            "timestamp|user|userid|comment|canonicaltitle|url|size|"
            "sha1|mime|metadata|commonmetadata|extmetadata|bitdepth"
        )

        while True:
            data = self.request(url, params=params).json()

            try:
                pages = data["query"]["pages"]
            except KeyError:
                pass
            else:
                yield from pages.values()

            try:
                continuation = data["continue"]
            except KeyError:
                break
            params.update(continuation)


BASE_PATTERN = WikimediaExtractor.update({
    "wikipedia": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wikipedia\.org",
        "api-path": "/w/api.php",
    },
    "wiktionary": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wiktionary\.org",
        "api-path": "/w/api.php",
    },
    "wikiquote": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wikiquote\.org",
        "api-path": "/w/api.php",
    },
    "wikibooks": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wikibooks\.org",
        "api-path": "/w/api.php",
    },
    "wikisource": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wikisource\.org",
        "api-path": "/w/api.php",
    },
    "wikinews": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wikinews\.org",
        "api-path": "/w/api.php",
    },
    "wikiversity": {
        "root": None,
        "pattern": r"[a-z]{2,}\.wikiversity\.org",
        "api-path": "/w/api.php",
    },
    "wikispecies": {
        "root": "https://species.wikimedia.org",
        "pattern": r"species\.wikimedia\.org",
        "api-path": "/w/api.php",
    },
    "wikimediacommons": {
        "root": "https://commons.wikimedia.org",
        "pattern": r"commons\.wikimedia\.org",
        "api-path": "/w/api.php",
    },
    "mediawiki": {
        "root": "https://www.mediawiki.org",
        "pattern": r"(?:www\.)?mediawiki\.org",
        "api-path": "/w/api.php",
    },
    "fandom": {
        "root": None,
        "pattern": r"[\w-]+\.fandom\.com",
    },
    "mariowiki": {
        "root": "https://www.mariowiki.com",
        "pattern": r"(?:www\.)?mariowiki\.com",
    },
})


class WikimediaArticleExtractor(WikimediaExtractor):
    """Extractor for wikimedia articles"""
    subcategory = "article"
    pattern = BASE_PATTERN + r"/(?!static/)([^?#]+)"
    example = "https://en.wikipedia.org/wiki/TITLE"
