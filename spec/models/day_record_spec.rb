require 'rails_helper'

RSpec.describe Chat, day_record: :model do
  context "データが正しく保存される" do
  	it "日付が入力されていれば保存される" do
  	  day_record = create(:day_record)
  	  day_record.valid?
  	  expect(day_record).to be_valid
  	end
  end

  context "データが正しく保存されない" do

    it "ユーザーIDがなければ登録できない" do
      day_record = build(:day_record, user_id: nil)
      day_record.valid?
      expect(day_record.errors[:user_id]).to include("が入力されていません。")
    end

    it "日付が入力されていなければ保存されない" do
      day_record = build(:day_record, start_time: nil)
      day_record.valid?
      expect(day_record.errors[:start_time]).to include("が入力されていません。")
    end

    it "朝食が200文字以内でないと投稿できない" do
      day_record = build(:day_record, breakfast: "a" * 201)
      day_record.valid?
      expect(day_record.errors[:breakfast]).to include("は200文字以下に設定して下さい。")
    end

    it "昼食が200文字以内でないと投稿できない" do
      day_record = build(:day_record, lunch: "a" * 201)
      day_record.valid?
      expect(day_record.errors[:lunch]).to include("は200文字以下に設定して下さい。")
    end

    it "夕食が200文字以内でないと投稿できない" do
      day_record = build(:day_record, dinner: "a" * 201)
      day_record.valid?
      expect(day_record.errors[:dinner]).to include("は200文字以下に設定して下さい。")
    end

    it "間食が200文字以内でないと投稿できない" do
      day_record = build(:day_record, snack: "a" * 201)
      day_record.valid?
      expect(day_record.errors[:snack]).to include("は200文字以下に設定して下さい。")
    end

    it "メモが300文字以内でないと投稿できない" do
      day_record = build(:day_record, memo: "a" * 301)
      day_record.valid?
      expect(day_record.errors[:memo]).to include("は300文字以下に設定して下さい。")
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(DayRecord.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end