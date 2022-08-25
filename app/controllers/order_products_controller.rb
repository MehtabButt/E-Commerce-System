class OrderProductsController < ApplicationController
  respond_to :json 

  def destroy
    op = OrderProduct.find_by(id:params[:id])
    if op 
      if op.destroy
        render json: 'successfully deleted'
      else 
        render json: 'deletion failed'
      end
    else 
      render json: 'order product not exists'
    end
  end

  def total_products 
    orders = Order.where(buyer_id:current_user.id, shiped:false).includes(:order_products)
    cart_items = 0
    orders.each do |order|
      cart_items += order.order_products.sum { |order_product| order_product[:product_count] } 
    end
    render json: cart_items
  end
end
