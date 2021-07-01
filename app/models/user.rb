class User < ApplicationRecord
    validates :email, :first_name, :last_name, :street, :number, :city, :postcode, :country, presence: true
    has_secure_password

    has_many :posts
    has_many :sessions

    enum role: { admin: 0, super_admin: 1, member: 2}
end