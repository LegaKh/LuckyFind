# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ad do
    title { Faker::Lorem.word }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    date { rand(10**4).days.since }
    description { Faker::Lorem.paragraph }
    user_id { rand(1..1000) }
    content_id { rand(1..1000) }
    content_type { ["Doc","Pet","LicensePlate"].sample }
    association :user

    factory :ad_doc, class: "Ad" do
      association :content, factory: :doc
    end
 
    factory :ad_pet, class: "Ad" do
      association :content, factory: :pet
    end
 
    factory :ad_license_plate, class: "Ad" do
      association :content, factory: :license_plate
    end
  end
end
