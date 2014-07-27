# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ad do
    title "MyString"
    city "MyString"
    street "MyString"
    date "2014-07-26"
    description "MyText"
    user_id 1
    content_id 1
    content_type "MyString"
  end
end
