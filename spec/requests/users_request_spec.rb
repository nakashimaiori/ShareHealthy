require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe 'ユーザー新規登録' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it 'createが成功すること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'リダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to user_path(1)
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end

      it 'エラーが表示されること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include 'Nameが入力されていません。'
      end
    end
  end

  describe 'ユーザーログイン' do
    before do
      visit new_user_session_path
    end

    context 'ログイン画面に遷移' do
      it 'ログインに成功する' do
        fill_in "メールアドレス", with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
  end
end