require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'returns a users full name as a string' do
    user = FactoryBot.build(
      :user,
      first_name: 'Joe',
      last_name: 'Tester',
    )

    expect(user.name).to eq "Joe Tester"
  end
end
