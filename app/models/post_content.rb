class PostContent < ApplicationRecord
    belongs_to :category
    has_many :hide_users
    validates :body, presence: true
end
