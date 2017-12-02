FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Devise.friendly_token[0, 20] }
    provider 'github'
    uid { Faker::Number.number(10) }
  end
end
