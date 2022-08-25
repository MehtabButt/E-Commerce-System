class ProductsController < ApplicationController
    
    respond_to :json 
    skip_before_action :authenticate_user!, :only => [:index, :show]

    def index
        cat = Category.find_by(id: params[:category_id])
        if cat
            render json: cat.products
            return 
        end
        render json: {message: "#{params[:category_name]} does not exist", status: :not_found}
    end

    def show 
        p = Product.find(params[:id])
        if p
            render json: {product: p, seller: p.seller}
            return
        end
        render json: {message: "Product does not exist", status: :not_found}
    end
end
