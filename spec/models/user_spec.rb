require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a first name, last name, email and password' do
    user = User.new(
      first_name: 'Aaron',
      last_name: 'Sumner',
      email: 'tester@example.com',
      password: 'testtesttesttest',
    )
    expect(user).to be_valid
  end

  it 'is invalid without a first name'

  it 'is invalid without a last name'

  it 'is invalid without an email'

  it 'is invalid with a dupulicate email address'

  it 'returns a users full name as a string'
end