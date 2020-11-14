require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'ログイン前トップページ(ルート)' do
    context "ページが正しく表示される" do
      before do
        get root_path
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'ログイン前ページ(about)' do
    context "ページが正しく表示される" do
      before do
        get about_path
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end
    end
  end
end