module Types
  class PostInputType < GraphQL::Schema::InputObject
    description "Params to create/update/delete a Post"

    argument :id, ID, required: false
    argument :user_id, Int, required: false, camelize: false
    argument :body, String, required: true, camelize: false
  end
end