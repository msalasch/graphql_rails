module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :user, UserType, null: true, description: "Retrieves an user by ID" do
      argument :id, ID, required: true, description: 'An user id'
    end

    def user(id:)
      User.find_by(id: id)
    end

    field :post, PostType, null: true, description: "Retrieves a post by ID" do
      argument :id, ID, required: true, description: 'A Post id'
    end

    def post(id:)
      Post.find_by(id: id)
    end

    field :comment, CommentType, null: true, description: "Retrieves a comment by ID" do 
      argument :id, ID, required: true, description: 'A Comment id'
    end

    def comment(id:)
      Comment.find_by(id: id)
    end

    field :login, String, null: true, description: "User login" do 
      argument :email, String, required: true, description: "User email"
      argument :password, String, required: true, description: "User password"
    end

    def login(email:, password:)
      if user = User.find_by(email: email)&.authenticate(password)
        user.sessions.create.key
      else
        "User not found"
      end
    end

    field :current_user, UserType, null: true, description: "Get current user", camelize: false

    def current_user 
      context[:current_user]
    end

    field :logout, Boolean, null: false, description: "Log out user" do 
      argument :key, String, required: true, description: "Session key"
    end 

    def logout(key:)
      Session.find_by(key: key).destroy
      true
    end


  end
end
