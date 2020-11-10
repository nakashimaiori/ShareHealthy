FactoryBot.define do
  factory :post do
    association :user
    association :genre
    title {"test"}
    content {"test"}
  end
end