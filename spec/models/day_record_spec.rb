require 'rails_helper'

RSpec.describe Chat, day_record: :model do
  context "データが正しく保存される" do
  	it "日付が入力されていれば保存される" do
  	  day_record = build(:day_record, start_time: "2020-11-11")
  	  day_record.valid?
  	  expect(day_record).to be_valid
  	end
  end

  context "データが正しく保存されない" do
    it "日付が入力されていなければ保存されない" do
      day_record = build(:day_record, start_time: nil)
      day_record.valid?
      expect(day_record.errors[:start_time]).to include("が入力されていません。")
    end
  end
end