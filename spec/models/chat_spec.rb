require 'rails_helper'

RSpec.describe Chat, type: :model do
  context "データが正しく保存される" do
  	it "メッセージが入力されていれば保存される" do
  	  chat = build(:chat)
  	  chat.valid?
  	  expect(chat).to be_valid
  	end
  end

  context "データが正しく保存されない" do
  	it "messageが入力されていなければ保存されない" do
      chat = build(:chat, message: nil)
      chat.valid?
      expect(chat.errors[:message]).to include("が入力されていません。")
    end

  	it "messageが200文字以内でないと投稿できない" do
      chat = build(:chat, message: "a" * 201)
      chat.valid?
      expect(chat.errors[:message]).to include("は200文字以下に設定して下さい。")
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end