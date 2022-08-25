class CategoriesController < ApplicationController
    
    skip_before_action :authenticate_user!, :only => [:index, :show]
    respond_to :json


    def index
        render json: Category.all
    end

    def create
        category = Category.new(category_params)

        if category.save
            render json: category
        else 
            render json: category.errors.messages
        end
    end

    private 
    
    def category_params
        params.require(:category).permit(:name)
    end
end
