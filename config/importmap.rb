# Pin npm packages by running ./bin/importmap

pin "vue", to: "https://cdn.jsdelivr.net/npm/vue@2.7.8/dist/vue.esm.browser.js"
# pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.26/dist/vue.esm-browser.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/components", under: "components"

pin "application", preload: true
