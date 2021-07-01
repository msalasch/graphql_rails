module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    #USER MUTATIONS

    field :create_user, UserType, mutation: Mutations::CreateUser, description: "Create an user", camelize: false

    field :update_user, UserType, null: false, description: "Update an user", camelize: false do 
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.find_by(id: user[:id])
      existing&.update user.to_h
      existing
    end

    field :delete_user, Boolean, null: false, description: "Delete an user", camelize: false do
      argument :id, ID, required: true 
    end

    def delete_user(id:)
      User.find_by(id: id).destroy
      true
    end

    # POST MUTATIONS

    field :create_post, PostType, mutation: Mutations::CreatePost, description: "Create a post", camelize: false

    field :update_post, PostType, null: false, description: "Update a post", camelize: false do 
      argument :post, Types::PostInputType, required: true
    end

    def update_post(post:)
      post_to_update = Post.find_by(id: post[:id])
      post_to_update&.update post.to_h
      post_to_update
    end

    field :delete_post, Boolean, null: false, description: "Delete a post", camelize: false do 
      argument :id, ID, required: true
    end

    def delete_post(id:)
      Post.find_by(id: id).destroy
      true
    end

    #COMMENT MUTATIONS

    field :create_comment, CommentType, mutation: Mutations::CreateComment, description: "Create a comment", camelize: false

    field :update_comment, CommentType, null: false, description: "Update a comment", camelize: false do 
      argument :comment, Types::CommentInputType, required: true
    end

    def update_comment(comment:)
      comment_to_update = Comment.find_by(id: comment[:id])
      comment_to_update&.update comment.to_h
      comment_to_update
    end

    field :delete_comment, Boolean, null: false, description: "Delete a comment", camelize: false do 
      argument :id, ID, required: true
    end

    def delete_comment(id:)
      Comment.find_by(id: id).destroy
      true
    end

  end
end
