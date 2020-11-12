FactoryBot.define do
  factory :post_comment do
    association :user
    association :post
    comment {"テスト"}
  end
end