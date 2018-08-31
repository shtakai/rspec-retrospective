FactoryBot.define do
  factory :user, aliases: %i(owner) do
    first_name { 'Aaron' }
    last_name { 'Sumner' }
    sequence(:email) { |n| "tester-#{n}@example.com" }
    password { 'aaronpassword' }
  end
end
