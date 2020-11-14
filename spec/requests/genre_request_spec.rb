require 'rails_helper'

RSpec.describe "Genre", type: :request do
  describe 'ジャンル一覧ページ' do
    context "一覧が正しく表示される" do
      before do
        get admins_genres_path
      end
      it 'サインインページにリダイレクトされること。' do
        expect(response.status).to eq 302
      end
    end
  end
end