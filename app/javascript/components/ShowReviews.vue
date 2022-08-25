<template>
<div id="show-review">
    
    <div class="antialiased mx-auto mt-2 max-w-screen-sm">

    <div class="flex">
        <div class="flex-1 border rounded-lg px-4 py-2 leading-relaxed">
            <review v-if="fetched" v-for="comment in comments" :key="comment.id" :comment="comment" :product-id="productId" />
        </div>
    </div>

    
    </div>
</div>
</template>

<script>
import axios from 'axios';
import Review from './Review.vue'

export default {
    props: {
        productId: {
            type: Number
        },
        newComment: {
            type: Object 
        }
    },
    data() {
        return {
            comments: [],
            fetched: false,
        }
    },
    watch: {
        newComment: function(val, oldVal) {
            this.comments.push(val) 
        }
    },
    methods: {
    },
    components: {
        Review
    },
    mounted: async function() {
        try {
            const res = await axios.get(`${this.$url}/products/${this.productId}/comments`, {
                    comment: {
                        product_id: this.productId
                    }
                });
            console.log(res)
            this.comments = res.data.comments 
            this.fetched = true 
        } 
        catch (err) {
            console.log(err)
        }
    }
}
</script>

<style scoped>
</style>