FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    name { Faker::Name.name }
    admin { true }
  end
end
