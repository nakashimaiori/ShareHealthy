require 'rails_helper'

RSpec.describe "Post", type: :request do
  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        get new_post_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

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