# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    title "MyString"
    slug "MyString"
    content "MyText"
    user nil
    created_by 1
    created_ip "MyString"
    updated_by 1
    updated_ip "MyString"
  end
end
