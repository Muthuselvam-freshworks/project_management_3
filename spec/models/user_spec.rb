require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'is valid for creating user' do
    user = User.create(first_name: 'muthu', last_name: 'selvam', email: 'test@example.com', password: 'password123' , password_confirmation: 'password123')
    expect(user).to be_valid
  end

end