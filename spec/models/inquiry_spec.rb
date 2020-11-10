require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  context "名前とemailが入力されているので保存される" do
    it "全て入力してあるので登録される" do
      inquiry = build(:inquiry)
      inquiry.valid?
      expect(inquiry).to be_valid
    end
  end

  context "データが正しく登録されない(バリテーション)" do
    it "名前がなければ登録できない" do
      inquiry = build(:inquiry, name: nil)
      inquiry.valid?
      expect(inquiry.errors[:name]).to include("名前を入力してください")
    end

    it "emailがなければ登録できない" do
      inquiry = build(:inquiry, email: nil)
      inquiry.valid?
      expect(inquiry.errors[:email]).to include("メールアドレスを入力してください")
    end
  end
end