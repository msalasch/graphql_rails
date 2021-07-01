module Types
  class CommentType < Types::BaseObject
    description "Comment type"

    field :id, ID, null: false 
    field :post_id, Int, null: false, camelize: false
    field :body, String, null: false, camelize: false

  end
end