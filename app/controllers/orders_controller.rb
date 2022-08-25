class OrdersController < ApplicationController
    respond_to :json

    def index 
        cart = Order.where(buyer_id:current_user.id, shiped:false).as_json(include: [:order_products, :products])
        render json: cart 
    end

    def create
        order = current_user.placed_orders.where(shiped: false, seller_id: order_params[:seller_id])[0]
        if order
            order_product = order.order_products.where(product_id: order_products_params[:product_id])[0]
            if order_product 
                add_qty_to_order_product(order_product)
            else 
                add_product_to_order(order)
            end
        else 
            place_new_order()
        end 
    end

    def checkout
        pendind_orders = current_user.placed_orders.where(shiped:false)
        if pendind_orders
            pendind_orders.update_all(shiped: true)
            render json: 'order shiped'
        else 
            render json: 'no order pending'
        end
    end

    private 

    def add_qty_to_order_product(order_product)
        begin
            order_product.update(product_count:order_product.product_count+order_products_params[:product_count])
            render json: 'successfully quantity added'
        rescue => exception
            render json: exception
        end
    end

    def add_product_to_order(order)
        begin
            order.order_products.create(order_products_params)
            render json: 'successfully added new product'
        rescue => exception
            render json: exception
        end
    end

    def place_new_order
        begin 
            current_user.placed_orders.create(order_params).order_products.create(order_products_params)
            render json: 'successfully created'
        rescue => exception
            render json: exception
        end
    end

    def order_params
        params.require(:order).permit(:seller_id)
    end

    def order_products_params
        params.require(:order_products).permit(:price, :product_id, :product_count)
    end
end
