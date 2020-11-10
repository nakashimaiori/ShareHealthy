FactoryBot.define do
  factory :day_record do
    association :user
    start_time {"2020-11-10"}
    breakfast {"食パン"}
    lunch {"鮭おにぎり２個"}
    dinner {"トマトサラダ"}
    snack {"ピーナッツ"}
  end
end