<template>
<div id="products">
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-wrap -m-4">

                <div class="w-full w-full mb-4">
                    <h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">{{category_name}}</h1>
                    <div class="h-1 w-20 bg-green-500 rounded"></div>
                </div>

                <template v-if="products.length !== 0">

                <router-link :to="{name: 'product', params:{product_name: product.name, productId: product.id}}" tag="div" class="p-4 md:w-1/4 hover:cursor-pointer" v-for="product in products" :key="product.id">
                    <div class="h-full border-2 border-gray-200 border-opacity-60 rounded-lg overflow-hidden">
                    <img class="lg:h-48 md:h-36 w-full object-cover object-center" src="https://dummyimage.com/700x500" alt="blog">
                    <p class="text-sm font-light text-gray-900 mb-1 ml-1">{{product.name}}</p>
                    <p class="title-font text-2xl font-normal text-gray-900 ml-1">{{Number(product.price)}} Rs</p>
                    <p class="text-sm font-light text-red-600 line-through mb-1 ml-1" v-if="!product.availability">Out of Stock</p>
                    </div>
                </router-link>

                </template>

                <template v-else> 
                    <p>No Product Added Yet</p>
                </template>

            </div>
        </div>
    </section>
</div>
</template>

<script>
import axios from 'axios'

export default {

    props: {
        category_name: {
            type: String 
        },
        category_id: {
            type: Number
        }
    },
    data() {
        return {
            products: []
        }
    },
    mounted: async function() {
        axios.get(`${this.$url}/categories/${this.category_id}/products`)
            .then(
                (response) => {
                    this.products = response.data
                }
            )
            .catch(
                (error) => {
                    console.log(error)
                }
            )
    }
}
</script>

<style>
</style>