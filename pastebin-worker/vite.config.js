import { defineWorkersConfig } from "@cloudflare/vitest-pool-workers/config"

const cfg = defineWorkersConfig({
  assetsInclude: ["frontend/*", "doc/*", "test/resources/*"],

  test: {
    coverage: {
      provider: "istanbul", // v8 is not supported due for cf workers
      reporter: ["text", "json", "html"],
    },
    poolOptions: {
      workers: {
        wrangler: {
          configPath: "./wrangler.toml",
        },
      },
    },
  },
})

export default cfg
