FactoryGirl.define do
  factory :doc do
    doc_type { Faker::Lorem.word }
    doc_code { Faker::Lorem.characters(5..15) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
