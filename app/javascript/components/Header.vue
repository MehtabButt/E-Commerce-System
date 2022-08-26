<template>
    <div id="header">
        <header class="text-gray-600 body-font">
            <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
                <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0" :href="this.$url">
                    <img src="https://img.icons8.com/color/48/000000/shopping-bag--v2.png"/>
                    <span class="ml-3 text-xl">E-Commerce Store</span>
                </a>
                <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
                    <router-link :to="{name:'admin'}" tag="button" class="cursor-pointer mr-5 hover:text-gray-900"
                     :class="{hidden:!isAdmin}">
                        Admin 
                    </router-link>
                    <button to="/sign_in" class="cursor-pointer mr-5 hover:text-gray-900" 
                            :class="{'hidden':isSignedIn}"
                            @click="singnIn">
                        Sign in
                    </button>
                    <button class="mr-5 hover:text-gray-900" :class="{'hidden':isSignedIn}" @click="signUp">
                        Sign Up
                    </button>
                    <button class="mr-5 hover:text-gray-900" :class="{'hidden':!isSignedIn}" @click="logoutUser">
                        Sign out 
                    </button>
                    <router-link :to="{name:'cart'}" tag="button" class="mr-5 hover:text-gray-900" :class="{hidden:!isSignedIn}">
                        <font-awesome-layers full-width>
                            <font-awesome-icon icon="fa-solid fa-cart-shopping" class="fa-2x" />
                            <font-awesome-layers-text counter :value="this.$cartItems" class="fa-3x" position="top-right bg-green-500 counter-position" />
                        </font-awesome-layers>
                    </router-link>
                </nav>
            </div>
        </header>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        name: 'header',
        props: ['signedIn', 'userType'],
        methods: {
            logoutUser: async function() {
                axios.delete(this.$url.concat('/users/sign_out'))
                    .then(response => {
                        if(response.status == 204) {
                            window.location.replace(`${this.$url}`)
                        }
                    })
                    .catch(
                        (error) => {
                            console.log(error);
                        }
                    );
            },
            singnIn: async function() {
                window.location.replace(this.$url.concat('/users/sign_in'))
            },
            signUp: async function() {
                window.location.replace(this.$url.concat('/users/sign_up'))
            }
            
        },
        data() {
            return {
            }
        },
        computed: {
            isSignedIn: function() {
                return this.signedIn === 'true'
            },
            isAdmin: function() {
                if (this.signedIn && this.userType==='admin') {
                    return true 
                }
                return false 
            }
        },
        watch: {
        '$cartItems'(newValue) {
            console.log('cartItems ', newValue)
        }
        },
        mounted: async function() {
            if (this.isSignedIn) {
                axios.get(`${this.$url}/total_order_products`)
                .then((res) => {
                    console.log(res)
                    this.$cartItems = res.data 
                })
                .catch((err) => {
                    console.log(err)
                })
            }
        }
    }
</script>

<style scoped>
.counter-position {
    margin-top:-1rem;
    margin-right: -2rem;
}
</style>