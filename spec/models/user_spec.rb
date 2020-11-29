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

      it '一意であること' do
        # 登録できたら失敗
        user = build(:user)
        user_2 = build(:user)
        user.email = 'test1@test.co.jp'
        user.save
        user_2.email = 'test1@test.co.jp'
        user_2.save
        user_2.valid?
        expect(user_2).to be_invalid
        # expect(test_user_2).not_to be_validの上記と同じ意味
      end

      it '一意でない場合はエラーが出る' do
        user = build(:user)
        user_2 = build(:user)
        user.email = 'test1@test.co.jp'
        user.save
        user_2.email = 'test1@test.co.jp'
        user_2.save
        user_2.valid?
        expect(user_2.errors[:email]).to include("は既に使用されています。")
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

    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
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