require 'rails_helper'

RSpec.describe Post, type: :model do

  context "全て入力されているので保存される" do
    it "全て入力してあるので保存される" do
      post = create(:post)
      post.valid?
      expect(post).to be_valid
    end
  end

  context "データが正しく保存されない(バリテーション)" do
    it "ユーザーIDがなければ登録できない" do
      post = build(:post, user_id: nil)
      post.valid?
      expect(post.errors[:user_id]).to include("が入力されていません。")
    end

    it "ジャンルIDがなければ登録できない" do
      post = build(:post, genre_id: nil)
      post.valid?
      expect(post.errors[:genre_id]).to include("が入力されていません。")
    end

    it "タイトルがなければ投稿できない" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("が入力されていません。")
    end

    it "タイトルが30文字以内でないと投稿できない" do
      post = build(:post, title: "a" * 31)
      post.valid?
      expect(post.errors[:title]).to include("は30文字以下に設定して下さい。")
    end

    it "投稿内容がなければ投稿できない" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("が入力されていません。")
    end

    it "投稿内容が10000文字以内でないと投稿できない" do
      post = build(:post, content: "a" * 10001)
      post.valid?
      expect(post.errors[:content]).to include("は10000文字以下に設定して下さい。")
    end

  end
end

RSpec.describe "Post", type: :request do
  # let(:post) { create(:post) }　これを書けば、それぞれ post = build(:post)を定義する必要なし。

    describe 'GET #index' do
      it 'リクエストが成功すること' do
        post = build(:post)
        get posts_url
        expect(response.status).to eq 200
      end
    end

    describe 'GET #show' do
      it 'リクエストが成功すること' do
        post = build(:post)
        get posts_url post.id
        expect(response.status).to eq 200
      end
    end
end