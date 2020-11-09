FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}oo"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password {"000000"}
    password_confirmation {"000000"}
  end
end