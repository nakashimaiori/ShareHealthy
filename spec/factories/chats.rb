FactoryBot.define do
  factory :chat do
  	association :user
  	association :room
  	message {"こんにちは"}
  end
end