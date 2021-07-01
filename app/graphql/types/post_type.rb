module Types
  class PostType < Types::BaseObject
    description "Post type"

    field :id, ID, null: false 
    field :user_id, Int, null: false, camelize: false
    field :body, String, null: false, camelize: false
    field :comments, [CommentType], null: false, camelize:false

  end
end