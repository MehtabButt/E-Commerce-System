<template>
<div id="review" class="mt-2">

    <strong>{{comment.commenter}}</strong><span class="text-xs text-gray-400 ml-2">{{commentTimeStemp}}</span>
    <p class="text-sm">{{comment.reply}}</p>
    <button class="uppercase tracking-wide text-gray-400 font-bold text-xs" @click="addReply=!addReply">Reply</button>
    <button class="text-sm text-gray-500 font-semibold" 
        v-show="hasReplies"
        @click="toggleReplies"
        @keypress="toggleReplies">
            {{replyCount}} {{Replies}}
    </button>
    <div v-show="addReply">
        <textarea
            class="w-full h-20 p-2 border rounded focus:outline-none focus:ring-gray-300 focus:ring-1"
            name="comment"
            placeholder="Write a Comment..."
            v-model="reply" required>
        </textarea>
        <button class="uppercase tracking-wide text-gray-400 font-bold text-xs w-full flex justify-end px-5"
                @click="postReply">
            Post
        </button>
    </div>
    <div v-if="hasReplies" class="flex" v-show="showReplies">
        <div class="flex-1 border rounded-lg px-4 py-2 leading-relaxed" ref="appendReply" >
            <review 
                v-for="reply in comment.replies"
                :key="reply.id"
                :comment="reply"
                :product-id="productId"
            />
        </div>
    </div>
    <div v-else class="flex" v-show="showReplies">
        <div class="flex-1 border rounded-lg px-4 py-2 leading-relaxed" ref="appendReply">
            <!-- for appending nested reply -->
        </div>
    </div>

</div>
</template>

<script>
import axios from 'axios'
import Review from './Review.vue'
import Vue from 'vue'

export default { 
    name: 'review',
    props: {
        comment: {
            type: Object
        },
        productId: {
            type: Number 
        }
    },
    data() {
        return {
            showReplies: false,
            addReply: false,
            reply: '',
            // replyCount: this.comment.replies.length  
        }
    },
    computed: {
        hasReplies: function() {
            return this.comment.hasOwnProperty('replies') && this.comment.replies.length > 0  
        },
        Replies: function() {
            if (this.hasReplies) {
                if (this.comment.replies.length>1) {
                    return 'Replies'
                }
                return 'Reply'
            }
        },
        commentTimeStemp: function() {
            createdAt = new Date(this.comment.created_at)
            return createdAt.toDateString() + ', ' + createdAt.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
        },
        replyCount: function() {
            if (this.hasReplies) {
                return this.comment.replies.length 
            }
        }
    },
    methods: {
        toggleReplies: function() {
            this.showReplies = !this.showReplies
        },
        insertReply: function(comment) {
            if (this.comment.hasOwnProperty('replies')) {
                this.comment.replies.push(comment)
            }
            else {
                this.comment.replies = new Array(comment) 
            }
        },
        postReply: async function() {
            try {
                const res = await axios.post(`${this.$url}/products/${this.productId}/comments`, {
                                comment: {
                                    product_id: this.productId,
                                    comment_id: this.comment.id,
                                    reply: this.reply
                                }
                            })
                console.log(res) 
                
                this.reply = ''
                this.insertReply(JSON.parse(res.data.comment))
                var ReviewClass = Vue.extend(Review)
                var reviewInstance = new ReviewClass({
                    propsData: {
                        comment: JSON.parse(res.data.comment),
                        productId: this.productId
                    }
                })
                reviewInstance.$mount()
                this.$refs.appendReply.appendChild(reviewInstance.$el)
            }
            catch (err) {
                console.log(err)
            }
            finally {
                this.addReply = false 
                this.showReplies = true 
            }
        }
    }
        
}
</script>

<style>
</style>