require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'お問い合わせページが正しく表示される。' do
    context "ページが正しく表示される" do
      before do
        get inquiry_path
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end
    end
  end
end