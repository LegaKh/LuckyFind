# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    pet_type { Faker::Lorem.characters(2..20) }
  end
end
