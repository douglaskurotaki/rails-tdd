# This will guess the User class
FactoryBot.define do
  factory :customer, aliases: [:user] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
