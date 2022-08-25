class Category < ApplicationRecord
    has_and_belongs_to_many :products, class_name: 'Product', validate: true 
    has_one_attached :picture     
    validates :name, presence: true 

    after_commit :add_default_cover, on: [:create, :update]

    private
    def add_default_cover
        unless picture.attached?
            self.picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "category", "default_category.png")), filename: 'default_category.png' , content_type: "image/png")
        end
    end
end
