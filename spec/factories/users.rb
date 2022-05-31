FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    profile { Faker::Lorem.paragraph }
    bio { Faker::Lorem.paragraph }
  end
end
