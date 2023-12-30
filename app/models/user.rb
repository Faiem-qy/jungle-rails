class User < ApplicationRecord
  has_secure_password

   # Validate presence and format of email
   validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
 end

