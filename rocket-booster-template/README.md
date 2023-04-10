![Header](https://raw.githubusercontent.com/xiaoyang-sde/reflare/master/.github/img/header.jpg)

[![Deploy to Cloudflare Workers](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/xiaoyang-sde/reflare-template)

`reflare-template` is a minimal template to kickstart a worker with [Reflare](https://github.com/xiaoyang-sde/reflare) and TypeScript.

## Installation

- Generate a new project from [reflare-template](https://github.com/xiaoyang-sde/reflare-template) and install the dependencies, which include `reflare`, `wrangler`, `typescript`, and `@cloudflare/workers-types`.

```console
npm init cloudflare reflare-app https://github.com/xiaoyang-sde/reflare-template
cd reflare-app
npm install
```

- Authenticate `wrangler` with a Cloudflare account.

```console
npx wrangler login
```

- Edit or add route definitions in `src/index.ts`. Please refer to [the documentation of Reflare](https://github.com/xiaoyang-sde/reflare/blob/master/README.md).

- Run `npm run dev` to preview Reflare with a local development server.

- Run `npm run publish` to publish Reflare on Cloudflare Workers.
