<template>
<div id="add-review">
    <div class="max-w-lg rounded-lg shadow-md shadow-blue-600/50 mx-auto">
        <div class="w-full p-4">
            <div class="mb-2">
            <label for="comment" class="text-lg text-gray-600">Add Comment</label>
            <textarea
                class="w-full h-20 p-2 border rounded focus:outline-none focus:ring-gray-300 focus:ring-1"
                name="comment"
                placeholder="Add Product Review" v-model="reply" required></textarea>
            </div>
            <div class="flex justify-end">
            <button class="px-3 py-2 text-sm text-white bg-green-600 rounded" @click="addReview">
                Post
            </button>
            </div>
        </div>
    </div>
    <show-review :product-id="productId" :new-comment="newComment"></show-review>
</div>
</template>

<script>
import axios from 'axios';
import ShowReview from './ShowReviews.vue'

export default {
    name:'review',
    props : {
        productId: {
            type: Number
        }
    },
    components: {
        ShowReview
    },
    data() {
        return {
            reply: '',
            newComment: null 
        }
    },
    methods: {
        addReview: async function() {
            try {
                const res = await axios.post(`${this.$url}/products/${this.productId}/comments`, {
                    comment: {
                        comment_id: null,
                        product_id: this.productId,
                        reply: this.reply
                    }
                });
                console.log(res);
                this.newComment = JSON.parse(res.data.comment)
                this.reply = ''
            }
            catch (err) {
                console.log(err);
            }
        }
    }
}
</script>

<style scoped>
</style>