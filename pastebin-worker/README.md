# Pastebin-worker

This is a pastebin that can be deployed on Cloudflare workers. Try it on [shz.al](https://shz.al).

**Philosophy**: effortless deployment, friendly CLI usage, rich functionality.

**Features**:

1. Share your paste with as short as 4 characters
2. Customize the paste URL
4. **Update** and **delete** your paste as you want
5. **Expire** your paste after a period of time
6. **Syntax highlighting** powered by PrismJS
7. Display **markdown** file as HTML
8. Used as a URL shortener
9. Customize returned mimetype

## Usage

1. You can post, update, delete your paste directly on the website (such as [shz.al](https://shz.al)).

2. It also provides a convenient HTTP API to use. See [API reference](doc/api.md) for details. You can easily call API via command line (using `curl` or similar tools).

3. [pb](/scripts) is a bash script to make it easier to use on command line.

## Limitations

1. If deployed on the Cloudflare Worker free-tier plan, the service allows at most 100,000 reads and 1000 writes, 1000 deletes per day.
2. Due to the size limit of Cloudflare KV storage, the size of each paste is bounded under 25 MiB.

## Deploy

You are free to deploy the pastebin on your own domain if you host your domain on Cloudflare.

Requirements:
1. \*nix environment with bash and basic cli programs. Try cygwin, WSL or something if using Windows.
2. GNU `make` and `yarn`

**Step 1**. Create a KV namespaces on Cloudflare workers dashboard and remember its namespace ID.

**Step 2**. Clone the repository and enter the directory. Run `yarn` to install dependencies.

**Step 3**. Modify entries in `wrangler.toml` according to your own account information (routes, kv namespace ids are what you need to modify).

> [!NOTE]
> Ensure that the domain in your routes configuration is hosted on your Cloudflare account.

**Step 4**. Modify the contents in `config.json`: `BASE_URL` is the URL of your site (no trailing slash); `FAVICON` is the URL to the favicon you want to use on your site.

**Step 5**. Run `make deploy` and enjoy.

The command `make deploy` does the following things:

1. generate the HTML file for frontend pages.
2. Upload these HTML file to your KV store.
3. Build and upload the JavaScript file for the Cloudflare worker.

## Auth

If you want a private deployment (only you can upload paste, but everyone can read the paste), add the following entry to your `config.json` (other configurations also contained in the outmost brace):

```json
{
  "basicAuth": {
    "enabled": true,
    "passwd": {
      "admin1": "this-is-passwd-1",
      "admin2": "this-is-passwd-2"
    }
  }
}
```

Now every access to PUT or POST request, and every access to the index page, requires an HTTP basic auth with the user-password pair listed above. For example: 

```shell
$ curl example-pb.com
HTTP basic auth is required

$ curl -Fc=@/path/to/file example-pb.com
HTTP basic auth is required

$ curl -u admin1:wrong-passwd -Fc=@/path/to/file example-pb.com
Error 401: incorrect passwd for basic auth

$ curl -u admin1:this-is-passwd-1 -Fc=@/path/to/file example-pb.com
{
  "url": "https://example-pb.com/YCDX",
  "suggestUrl": null,
  "admin": "https://example-pb.com/YCDX:Sij23HwbMjeZwKznY3K5trG8",
  "isPrivate": false
}
```
