module Mutations
  class CreateComment < GraphQL::Schema::Mutation
    description "Create a comment"

    argument :comment, Types::CommentInputType, required: true, camelize: false

    def resolve(comment:)
      if !context[:current_user].member?
        raise GraphQL::ExecutionError,"You dont have permissions to perform this action"
      end
      Comment.create!(comment.to_h)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end

  end
end