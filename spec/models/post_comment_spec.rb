require 'rails_helper'

RSpec.describe PostComment, type: :model do

  context "全て入力されているので保存される" do
    it "全て入力してあるので保存される" do
      post_comment = create(:post_comment)
      post_comment.valid?
      expect(post_comment).to be_valid
    end
  end

  context "データが正しく保存されない(バリテーション)" do
    it "ユーザーIDがなければ登録できない" do
      post_comment = build(:post_comment, user_id: nil)
      post_comment.valid?
      expect(post_comment.errors[:user_id]).to include("が入力されていません。")
    end

    it "投稿IDがなければ登録できない" do
      post_comment = build(:post_comment, post_id: nil)
      post_comment.valid?
      expect(post_comment.errors[:post_id]).to include("が入力されていません。")
    end

    it "コメントがなければ登録できない" do
      post_comment = build(:post_comment, comment: nil)
      post_comment.valid?
      expect(post_comment.errors[:comment]).to include("が入力されていません。")
    end

    it "タイトルが200文字以内でないと投稿できない" do
      post_comment = build(:post_comment, comment: "a" * 201)
      post_comment.valid?
      expect(post_comment.errors[:comment]).to include("は200文字以下に設定して下さい。")
    end
  end
end