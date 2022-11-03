import { resolve } from "node:path"

import { defineConfig } from "vite"

import pkg from "./package.json"

// https://vitejs.dev/config/
export default defineConfig(({ ssrBuild, mode }) => {
	let define = {
		ENV: JSON.stringify(mode),
	}

	return {
		publicDir: false,
		define,
		build: {
			minify: mode === "production",
		},
		ssr: ssrBuild
			? {
					noExternal: [...Object.keys(pkg.dependencies)],
			  }
			: undefined,
		resolve: {
			alias: {
				"~": resolve("src"),
			},
		},
	}
})
