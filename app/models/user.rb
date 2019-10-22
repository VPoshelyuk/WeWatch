class User < ApplicationRecord
    has_secure_password
    validates :user_name, :first_name, :last_name, :age, :password, :phone_number, presence: true
    validates :phone_number, length: { is: 10 }
    validates :user_name, :phone_number, uniqueness: true
end

