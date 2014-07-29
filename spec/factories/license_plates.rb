# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :license_plate do
    number { Faker::Lorem.characters(rand(5..10)) }
  end
end
