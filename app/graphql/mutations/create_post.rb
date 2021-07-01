module Mutations
  class CreatePost < GraphQL::Schema::Mutation
    description "Create a post"

    argument :post, Types::PostInputType, required: true, camelize: false

    def resolve(post:)
      Post.create!(post.to_h)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end

  end
end