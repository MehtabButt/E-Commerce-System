<template>
<div id="admin">
    <section class="text-gray-600 z-40 body-font">
        <div class="container px-5 py-8 mx-auto">
            <div class="flex flex-col w-full mb-20">
            <h1 class="sm:text-4xl text-3xl font-medium title-font mb-2 text-gray-900">Admin Panel</h1>
            </div>
            <div class="lg:w-2/3 w-full mx-auto overflow-auto">
            <div class="mb-4">
                <span class="text-black font-medium text-2xl">Categories</span>
                <button @click="addCategory()" data-modal-toggle="authentication-modal" class="inline-flex float-right items-center justify-center space-x-2 py-3 px-4 border border-transparent text-sm font-medium rounded text-green-600 hover:text-green-700 bg-green-50 hover:bg-green-100 transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">  
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd" />
                    </svg>  
                    <div>Add Category</div>
                </button>
            </div>
            <table class="table-auto w-full whitespace-no-wrap">
                <thead>
                <tr>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">Name</th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100">Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="category in categories" :key="category.id">
                    <td class="px-4 py-3">{{category.name}}</td>
                    <td class="px-4 py-3 flex justify-center">
                        <button class="inline-flex items-center justify-center space-x-2 py-3 px-4 border border-transparent text-sm font-medium rounded text-blue-600 hover:text-blue-700 outline outline-offset-2 outline-blue-500 transition-colors">
                        <font-awesome-icon icon="fa-solid fa-eye" />
                        <div>Show</div>
                        </button>
                        <button class="inline-flex items-center justify-center space-x-2 py-3 px-4 border border-transparent text-sm font-medium rounded text-yellow-600 hover:text-yellow-700 outline outline-offset-2 outline-yellow-500 transition-colors">
                        <font-awesome-icon icon="fa-solid fa-pen" />
                        <div>Edit</div>
                        </button>
                        <button @click="deleteCategory(category.id)" class="inline-flex items-center justify-center space-x-2 py-3 px-4 border border-transparent text-sm font-medium rounded text-red-600 hover:text-red-700 outline outline-offset-2 outline-red-500 transition-colors">
                        <font-awesome-icon icon="fa-solid fa-trash-can" />
                        <div>Delete</div>
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
        </div>
    </section>
    <NewCategory :showNewCategory="showNewCategory" @closeNewCatModal="closeNewCatModal($event)"></NewCategory>
</div>
</template>

<script>
import axios from 'axios'
import NewCategory from './NewCategory.vue'

export default {
    name: 'admin',
    components: {
        NewCategory,
    },
    data() {
        return {
            categories: [],
            showNewCategory: false 
        }
    },
    methods: {
        reloadCategories: async function() {
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
        },
        addCategory: function() {
            this.showNewCategory = true
        },
        closeNewCatModal: function(reload) {
            this.showNewCategory = false 
            if (reload) {
                this.reloadCategories() 
            }
        },
        deleteCategory: async function(catId) {
            axios.delete()
        }
    },
    mounted: async function() {
       this.reloadCategories()
    }
}
</script>

<style scoped>
</style>