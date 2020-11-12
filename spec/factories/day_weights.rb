FactoryBot.define do
  factory :day_weight do
  	association :user
    weight {50}
    start_time {"2020-11-11"}
  end
end