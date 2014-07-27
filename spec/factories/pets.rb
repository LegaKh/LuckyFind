# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    pet_type { Faker::Lorem.word }
  end
end
