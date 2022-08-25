class Address < ApplicationRecord
    belongs_to :user 

    validates :city, :street_address, presence: true 
    validates :zipcode, length: { is: 5 }, numericality: { only_integer: true }, allow_nil: true 
end
