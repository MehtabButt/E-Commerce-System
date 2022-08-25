class CommentsController < ApplicationController
    respond_to :json
    
    def index 
        comments = [] 
        Comment.where(product_id:params[:product_id], comment_id:nil).each do |comment| 
            comments << replies(comment) 
        end
        render json: {comments: comments} 
    end

    def replies(comment)
        comments = comment.as_json
        comments["commenter"] = comment.user.name 
        unless comment.replies.empty?
            comment_replies = []
            comment.replies.each do |reply|
                comment_replies << replies(reply)
            end
            comments["replies"] = comment_replies
        else 
            _comment = comment.as_json
            _comment["commenter"] = comment.user.name 
            return _comment
        end
        comments
    end

    def create
        new_comment = Comment.new(
            product_id:comment_params[:product_id],
            user_id:current_user.id,
            comment_id:comment_params[:comment_id],
            reply: comment_params[:reply]
        )
        if new_comment.save
            _new_comment = new_comment.as_json
            _new_comment["commenter"] = new_comment.user.name 
            render json: {message: 'comment added', comment: _new_comment.to_json}
        else 
            render json: {message: new_comment.errors.messages}
        end
    end

    private 
    def comment_params 
        params.require(:comment).permit(:product_id, :comment_id, :reply)
    end
end
