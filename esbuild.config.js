const path = require('path');
const rails = require('esbuild-rails');
const vue = require('esbuild-vue');

require('esbuild')
  .build({
    entryPoints: ['application.js'],
    bundle: true,
    outdir: path.join(process.cwd(), 'app/assets/builds'),
    absWorkingDir: path.join(process.cwd(), 'app/javascript'),
    watch: process.argv.includes('--watch'),
    minify: true,
    sourcemap: process.argv.includes('--sourcemap'),
    loader: { '.svg': 'dataurl', '.png': 'dataurl' },
    plugins: [rails(), vue()]
  })
  .catch(() => process.exit(1));
