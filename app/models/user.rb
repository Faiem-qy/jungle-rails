require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

   # Validate presence and format of email
   validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

   # Add validation for minimum password length
   validates :password, presence: true, length: {minimum: 8}

   def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase)
    user && user.authenticate(password) ? user : nil
  end

 end

