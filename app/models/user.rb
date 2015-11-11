class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable,
           :trackable, :validatable,
           :omniauthable
  include DeviseTokenAuth::Concerns::User
end
