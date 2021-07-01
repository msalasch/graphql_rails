module Mutations
  class CreateUser < GraphQL::Schema::Mutation
    description "Create an user"

    # argument :first_name, String, required: true, camelize: false
    # argument :last_name, String, required: true, camelize: false
    # argument :street, String, required: true, camelize: false
    # argument :number, Int, required: true, camelize: false 
    # argument :city, String, required: true, camelize: false 
    # argument :postcode, Int, required: true, camelize: false
    # argument :country, String, required: true, camelize: false
    argument :user, Types::UserInputType, required: true, camelize: false

    # type Types::UserType

    # def resolve(first_name: nil, last_name:nil, street:nil, number:nil, city:nil, postcode:nil, country:nil)
    #   User.create!(
    #     first_name: first_name, 
    #     last_name: last_name, 
    #     street: street, 
    #     number: number, 
    #     city: city, 
    #     postcode: postcode, 
    #     country: country
    #   )
    # end

    def resolve(user:)
      if !context[:current_user].super_admin?
        raise GraphQL::ExecutionError,"You dont have permissions to perform this action"
      end
      User.create!(user.to_h)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
    
  end
end