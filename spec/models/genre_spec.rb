require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "全て入力されているので保存される" do
  	it "titleが入力されていれば保存される" do
  	  genre = build(:genre)
  	  genre.valid?
  	  expect(genre).to be_valid
  	end
  end

  context "データが正しく保存されない(バリテーション)" do
    it "nameがなければ投稿できない" do
      genre = build(:genre, name: nil)
      genre.valid?
      expect(genre.errors[:name]).to include("が入力されていません。")
    end

    it "nameが15文字以内でないと投稿できない" do
      genre = build(:genre, name: "a" * 16)
      genre.valid?
      expect(genre.errors[:name]).to include("は15文字以下に設定して下さい。")
    end
  end
end