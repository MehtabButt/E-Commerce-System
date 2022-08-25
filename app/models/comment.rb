class Comment < ApplicationRecord
    belongs_to :product, class_name: 'Product'
    belongs_to :user, class_name: 'User'

    has_many :replies, class_name:'Comment', foreign_key:'comment_id'
    belongs_to :comment, class_name:'Comment', foreign_key:'comment_id', optional: true 

    validates :reply, presence: true
end
