require 'rails_helper'

RSpec.describe DayWeight, type: :model do

  context "全て入力されているので保存される" do
    it "全て入力してあるので保存される" do
      day_weight = create(:day_weight)
      day_weight.valid?
      expect(day_weight).to be_valid
    end
  end

  context "データが正しく保存されない(バリテーション)" do
    it "ユーザーIDがなければ登録できない" do
      day_weight = build(:day_weight, user_id: nil)
      day_weight.valid?
      expect(day_weight.errors[:user_id]).to include("が入力されていません。")
    end

    it "日付がなければ登録できない" do
      day_weight = build(:day_weight, start_time: nil)
      day_weight.valid?
      expect(day_weight.errors[:start_time]).to include("が入力されていません。")
    end

    it "体重がなければ登録できない" do
      day_weight = build(:day_weight, weight: nil)
      day_weight.valid?
      expect(day_weight.errors[:weight]).to include("が入力されていません。")
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(DayWeight.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end