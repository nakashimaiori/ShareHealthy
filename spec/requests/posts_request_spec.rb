require 'rails_helper'

RSpec.describe "Post", type: :request do
  describe 'ログインしていない場合' do
    context "新規投稿ページ" do
      before do
        get new_post_path
      end
      it 'リダイレクトされること' do
        expect(response).to redirect_to  new_user_session_path
      end
    end
  end

  # let(:post) { create(:post) }　これを書けば、それぞれ post = build(:post)を定義する必要なし。
  context 'GET #index' do
    it 'リダイレクトされること' do
      post = build(:post)
      get posts_url
      expect(response).to redirect_to  new_user_session_path
    end
  end

  context 'GET #show' do
    it 'リダイレクトされること' do
      post = build(:post)
      get posts_url post.id
      expect(response).to redirect_to  new_user_session_path
    end
  end
end