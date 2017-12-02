FactoryGirl.define do
  factory :checklist do
    title { Faker::Lorem.sentence(1, false, 3) }
  end
end
