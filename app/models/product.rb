class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    acts_as_list
    has_many :cart_items
    has_many :carts, through: :cart_items,source: :cart
end
