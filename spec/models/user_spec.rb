require 'rails_helper'

RSpec.describe User, type: :model do
describe 'Validations' do
  it 'requires matching password and password_confirmation' do
    user = User.new(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'differentpassword'
    )
    expect(user).to_not be_valid
  end

  it 'requires email, first name, and last name' do
    user = User.new(
      email: nil,
      password: 'password',
      password_confirmation: 'password',
      first_name: nil,
      last_name: nil
    )
    expect(user).to_not be_valid
  end

  it 'validates uniquesness of email (case-insensitive)' do
    existing_user = User.create(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
     )

     user = User.new(
      email: 'TEST@EXAMPLE.COM',
      password: 'differentpassword',
      password_confirmation: 'differentpassword'
     )

     expect(user).to be_valid
  end
end
end
