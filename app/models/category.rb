class Category < ApplicationRecord
    has_many :post_contents
    validates :name, presence: true
end
