class Comment < ApplicationRecord
    validates :post_id, :body, presence: true

    belongs_to :post
end
