<template>
<div id="cart">
    <section class="text-gray-600 body-font overflow-hidden">
        <div class="container px-5 py-24 mx-auto">
            <div class="-my-8 divide-y-2 divide-gray-100">
                
            <template v-if="this.$cartItems === 0">
                <div class="bg-green-100 border-t border-b border-green-500 text-green-700 px-4 py-3" role="alert">
                    <p class="font-bold">Cart is Empty</p>
                    <p class="text-sm">Plz add products to cart before proceeding</p>
                </div>
            </template>

            <template v-else>
            <div v-for="order in cart" :key="order.id">
            <div class="py-8 flex flex-wrap md:flex-nowrap" v-for="(order_product, index) in order.order_products" :key="order_product.id">
                <div class="md:w-64 md:mb-0 flex-shrink-0 flex flex-col mr-5">
                    <img class="block mx-auto object-cover object-center rounded" alt="hero" src="https://dummyimage.com/720x600">
                </div>
                <div class="md:flex-grow w-3/4">
                    <h2 class="text-2xl font-medium text-gray-900 title-font mb-2">{{order.products[index].name}}</h2>
                    <p class="text-2xl">{{currencyFormat(Number(order_product.price))}} Rs</p>
                    <p v-if="order.products[index].availability" class="text-sm text-green-500">In Stock</p>
                    <p v-else class="text-sm text-red-500 line-through">Out of Stock</p>
                    <div>
                        <span class="text-black font-medium">Qty</span>
                        <span class="text-gray-900 ml-4">{{order_product.product_count}}</span>
                    </div>
                    <a class="text-indigo-500 items-center mt-4 cursor-pointer mt-2" @click="deleteItem(order_product.id, order_product.product_count)">Delete</a>
                </div>
            </div>
            </div>

            <div class="float-right">
                <span class="text-black font-medium">Total</span>
                <span class="ml-3 text-gray-800">{{total}} Rs</span><br>
                <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded-full" @click="checkout">Proceed to Checkout</button>
            </div>
            </template>

            </div>
        </div>
    </section>
</div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'Cart',
    data() { 
        return {
            cart: null,
            bill: 0
        }
    },
    methods: {
        currencyFormat: function(amount) {
            let currency = Intl.NumberFormat('en-IN')
            return currency.format(amount)
        },
        deleteItem: async function(id, count) {
            axios.delete(`${this.$url}/order_products/${id}`)
            .then((response) => {
                console.log(response)
                this.getCartData()  
                this.$cartItems = this.$cartItems - count 
            })
            .catch((error) => {
                console.log(error)
            })
        },
        getCartData: async function() {
            try {
                const res = await axios.get(`${this.$url}/orders`)
                this.cart = res.data
            }
            catch(err) {
                console.log(err) 
            }
        },
        checkout: async function() {
            axios.get(`${this.$url}/orders_checkout`)
            .then((response) => {
                console.log(response)
            })
            .catch((error) => {
                console.log(error)
            })
            this.getCartData()
        }
    },
    computed: {
        total: function() {
            for (order of this.cart){
                for (product of order.products) {
                    this.bill += Number(product.price) 
                }
            }
            
            return this.currencyFormat(this.bill)  
        }
    },
    mounted: function() {
        this.getCartData()
    }
}
</script>


<style>
</style>

