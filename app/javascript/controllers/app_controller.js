import Vue from "vue"
import App from '../components/App.vue'
import store from '../store'
import router from '../router/index.js'
import axios from 'axios'

Vue.config.productionTip = false;
Vue.prototype.$url= window.location.origin;

// cart items 
const cartItems = Vue.observable({ count: 0 }); 
Object.defineProperty(Vue.prototype, '$cartItems', {
  get() { return cartItems.count; },
  set(value) { cartItems.count = value; }
});

let token = document.head.querySelector('meta[name="csrf-token"]');
if (token) {
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
    axios.defaults.headers.common['Accept'] = 'application/json'
} else {
    console.error('CSRF token not found');
}

axios.interceptors.response.use(function (response) {
    return response;
  }, function (error) {
    if (error.response.status == 401 && error.response.statusText == "Unauthorized"){
        window.location.replace(`${this.$url}/users/sign_in`)
    }
    return Promise.reject(error);
  });

Vue.config.devtools = true;

// font awesome
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon, FontAwesomeLayers, FontAwesomeLayersText } from '@fortawesome/vue-fontawesome'
import { faCartShopping, faEye, faPen, faTrashCan } from '@fortawesome/free-solid-svg-icons'
library.add(faCartShopping, faEye, faPen, faTrashCan)
Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.component('font-awesome-layers', FontAwesomeLayers)
Vue.component('font-awesome-layers-text', FontAwesomeLayersText)

const top = "app"
document.addEventListener('DOMContentLoaded', () => { 
  const element = document.getElementById(top)
  Vue.prototype.$signedInUsername = element.dataset.signedInUsername
  if (element !== null) { 
    const app = new Vue({
        el: element,
        router: router,
        render: h => h(App, {props: { ...element.dataset }})
        }).$mount()
    }
})