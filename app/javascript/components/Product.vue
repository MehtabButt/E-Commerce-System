<template>
<div id="product">
    <section class="text-gray-600 body-font overflow-hidden">
        <div class="container px-5 py-24 mx-auto">
            <div class="lg:w-4/5 mx-auto flex flex-wrap">
            <img alt="ecommerce" class="lg:w-1/2 w-full lg:h-auto h-64 object-cover object-center rounded" src="https://dummyimage.com/400x400">
            <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
                <p class="text-gray-900 text-xl title-font font-medium mb-1">{{product.name}}</p>
                <div class="flex mt-6 items-center border-b-2 border-gray-100">
                </div>
                <div class="flex">
                <span class="title-font mt-2 font-normal text-2xl text-gray-900">{{Number(product.price)}} Rs</span>
                </div>
                <div class="grid grid-cols-1 gap-3 mt-4">
                    <div>
                        <p class="inline font-medium text-black">Brand: </p>
                        <p class="inline">{{product.brand}}</p>
                    </div>
                    <div>
                        <p class="inline font-medium text-black">Available: </p>
                        <p class="inline">{{product.count}}</p>
                        <span class="line-through text-red-400" v-if="!product.availability">Out of Stock</span>
                    </div>
                    <div>
                        <p class="inline font-medium text-black">Seller: </p>
                        <p class="inline">{{seller.name}}</p>
                    </div>
                </div>
                <div class="flex justify-end">
                    <div class="relative">
                        <span class="mr-3">Qty</span>
                        <select v-model="qty" class="rounded border appearance-none border-gray-300 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-200 focus:border-indigo-500 text-base pl-3 pr-10">
                            <option v-for="qty in qtyArray">{{qty}}</option>
                        </select>
                        <span>
                            <button @click="addToCart" class="ml-2 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-full">Add to Cart</button>
                        </span>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <add-review class="container px-5 mb-4 mx-auto" :product-id="productId"></add-review>
    </section>
</div>
</template>

<script>
import axios from 'axios'
import AddReview from './AddReview.vue'

export default {
    name: 'Product',
    props: {
        productId: {
            type: Number 
        }
    },
    components: {
        AddReview
    },
    data() {
        return {
            product: null,
            seller: null,
            qty: null,
        }
    },
    computed: {
        qtyArray: function() {
            return [...Array(this.product.count)].map((_, index) => index + 1)
        },
    },
    methods: {
        addToCart: async function() {
            axios.post(this.$url.concat('/orders'),
             {
                order: {seller_id: this.seller.id},
                order_products :{
                    price: this.product.price,
                    product_id: this.productId, 
                    product_count: this.qty
                }
             })
             .then((response) => {
                console.log(response)
                this.$cartItems = this.$cartItems + this.qty
                console.log(this.$cartItems)
             })
             .catch((error) => {
                console.log(error)
             })
        }
    },
    mounted: async function() {
        try {
            const response = await axios.get(`${this.$url}/products/${this.productId}`);
            let data = response.data;
            this.product = data.product; 
            this.seller = data.seller ;
            if (this.product.count > 0){
                this.qty = 1;
            }
            else {
                this.qty = 0;
            }
        }
        catch (error) {
            console.log(error)
        }
    }
}
</script>

<style>
</style>