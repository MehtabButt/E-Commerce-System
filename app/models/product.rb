class Product < ApplicationRecord
    belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
    
    has_many :order_products, class_name: 'OrderProduct'
    has_many :orders, class_name: 'Order', through: :order_product 

    has_and_belongs_to_many :categories, class_name:'Category', validate: true 

    has_many :comments, class_name: 'Comment', validate: true 

    has_many_attached :pictures 

    attribute :count, :integer, default: 0 
    attribute :availability, :boolean, default: false 
    
    validates :name, :price, :brand, presence: true 
    validates :price, numericality: { greater_than: 0 }

    after_initialize do |product|
        product.availability = true if product.count > 0 
    end
end
