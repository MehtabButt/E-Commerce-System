<template>

<div id="categories">
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-wrap -m-4">

                <router-link :to="{name: 'products_under_category', params: {category_name: cat.name, category_id: cat.id}}" tag="div" class="p-4 md:w-1/4 hover:cursor-pointer" v-for="cat in categories" :key="cat.id">
                    <div class="h-full border-2 border-gray-200 border-opacity-60 rounded-lg overflow-hidden">
                    <img class="lg:h-48 md:h-36 w-full object-cover object-center" src="https://dummyimage.com/700x500" alt="blog">
                    <h1 class="title-font text-lg font-medium text-gray-900 mb-1 ml-1">{{cat.name}}</h1>
                    </div>
                </router-link>

            </div>
        </div>
    </section>
</div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'Categories',
    data() {  
        return {
            categories: []
        }
    },
    mounted: async function() {
        axios.get(this.$url.concat('/categories'))
            .then(
                (response) => {
                    this.categories = response.data
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