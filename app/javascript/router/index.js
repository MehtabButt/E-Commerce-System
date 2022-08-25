import VueRouter from 'vue-router'
import Vue from 'vue'
import Categories from '../components/Categories.vue'
import Products from '../components/Products.vue'
import Product from '../components/Product.vue'
import Cart from '../components/Cart.vue'
import Admin from '../components/Admin/Admin.vue'
import NewCategory from '../components/Admin/NewCategory.vue'

Vue.use(VueRouter)

const routes = [
    {
        path:'/',
        name: 'categories',
        component: Categories,
        alias: '/categories'
    },
    {
        path: '/:category_name',
        name: 'products_under_category',
        component: Products,
        props: true 
    },
    {
        path: '/:category_name/:product_name',
        name: 'product',
        component: Product,
        props: true  
    },
    {
        path: '/cart',
        name: 'cart',
        component: Cart
    },
    {
        path: '/admin',
        name: 'admin',
        component: Admin
    }
]

const router = new VueRouter({
    mode: 'history',
    routes 
})
    
export default router 