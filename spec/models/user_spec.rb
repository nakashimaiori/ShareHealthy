require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'バリデーションのテスト' do

  	it "名前とメールアドレスとパスワードがあれば登録できる" do
    	user = build(:user)
    	user.valid?
    	expect(user).to be_valid
    end

    context 'nameカラム' do
      it "nameがなければ登録できない" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("が入力されていません。")
      end

      it "名前が2文字以上でないと登録できない" do
        user = build(:user, name: "a")
        user.valid?
        expect(user.errors[:name]).to include("は2文字以上に設定して下さい。")
      end

      it "名前が15文字以下でないと登録できない" do
        user = build(:user, name: "a" * 20)
        user.valid?
        expect(user.errors[:name]).to include("は15文字以下に設定して下さい。")
      end
    end

    context 'emailカラム' do
      it "emailがなければ登録できない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end
    end

    context 'introductionカラム' do
      it "自己紹介が200文字以下でないと登録できない。" do
        user = build(:user, introduction: "a" * 201)
        user.valid?
        expect(user.errors[:introduction]).to include("は200文字以下に設定して下さい。")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end

    context 'DayRecordモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:day_records).macro).to eq :has_many
      end
    end

      context 'DayWeightモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:day_weights).macro).to eq :has_many
      end
    end
  end
end