module Types
  class CommentInputType < GraphQL::Schema::InputObject
    description "Params to create/update/delete a Comment"

    argument :id, ID, required: false
    argument :post_id, Int, required: true, camelize: false
    argument :body, String, required: true, camelize: false
  end
end