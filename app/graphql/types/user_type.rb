module Types
  class UserType < Types::BaseObject
    description "User type"

    field :id, ID, null: false 
    field :email, String, null: false, camelize: false
    field :first_name, String, null: false, camelize: false
    field :last_name, String, null: false, camelize: false
    field :role, Int, null: false, camelize: false
    field :street, String, null: false, camelize: false
    field :number, Int, null: false, camelize: false 
    field :city, String, null: false, camelize: false 
    field :postcode, Int, null: false, camelize: false
    field :country, String, null: false, camelize: false
    field :full_name, String, null: false, camelize: false
    field :full_addres, String, null: false, camelize: false
    field :posts, [PostType], null: false, camelize: false

    def full_name
      ([object.first_name, object.last_name].compact).join(" ")
    end

    def full_addres
      ([object.country, object.city, object.street, object.postcode].compact).join(", ")
    end

    # def self.visible?(context)
    #   !!context[:current_user]
    # end

  end
end