class Order < ApplicationRecord
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

    has_many :order_products, class_name: 'OrderProduct'
    has_many :products, class_name: 'Product', through: :order_products

    attribute :shiped, :boolean, default: false
end
