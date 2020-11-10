FactoryBot.define do
  factory :post do
    association :user
    genre_id {1}
    content {"test"}
    title {"test"}
  end
end