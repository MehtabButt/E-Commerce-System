class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :user_type, [:admin, :buyer, :seller]

  has_one :address, validate: true, dependent: :destroy  

  has_many :selling_products, class_name: 'Product', foreign_key: 'seller_id', dependent: :destroy 
  has_many :placed_orders, class_name: 'Order', foreign_key: 'buyer_id'
  has_many :received_orders, class_name: 'Order', foreign_key: 'seller_id'

  has_many :comments, class_name: 'Comment', validate: true 
  
  validates :name, :user_type, :phone_no, presence: true 
  # validates :user_type, inclusion: { in: %w(admin seller buyer) }
  validates :phone_no, format: { with: /\A((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}\Z/ }
end
