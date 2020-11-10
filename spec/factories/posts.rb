FactoryBot.define do
  factory :post do
    association :user
    genre_id {1}
    title {"test"}
    content {"test"}
  end
end