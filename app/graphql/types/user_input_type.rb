module Types
  class UserInputType < GraphQL::Schema::InputObject

    description "Params to create/update/delete an User"

    argument :id, ID, required: false
    argument :email, String, required: true, camelize: false
    argument :password, String, required: true, camelize: false
    argument :role, Int, required: false, camelize: false
    argument :first_name, String, required: true, camelize: false
    argument :last_name, String, required: true, camelize: false
    argument :street, String, required: true, camelize: false
    argument :number, Int, required: true, camelize: false 
    argument :city, String, required: true, camelize: false 
    argument :postcode, Int, required: true, camelize: false
    argument :country, String, required: true, camelize: false

  end
end