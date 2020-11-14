require 'rails_helper'

RSpec.describe "Genre", type: :request do
  describe 'ジャンル新規一覧ページ' do
    context "一覧が正しく表示される" do
      before do
        get admins_genres_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end