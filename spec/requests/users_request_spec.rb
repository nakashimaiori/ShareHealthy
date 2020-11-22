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

  describe "ログインページが" do
    it '正しく表示されること' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'ユーザーログイン' do
    context 'ログインしていないユーザー' do
      it 'ログインページへリダイレクトする' do
        get user_path user.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


  describe "ユーザー編集ページを表示(GET #edit)" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get edit_user_path user.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    # context "ログインしている場合" do
    #   context "本人の場合" do
    #     it "リクエストが成功すること" do
    #       user = build(:user, id: 3)
    #       get edit_user_path (3)
    #       expect(response).to have_http_status "200"
    #     end
    #   end

    #   context "他のユーザーの場合" do
    #     it "ログイン前トップページへリダイレクトすること" do
    #       user = build(:user, id: 5)
    #       get edit_user_path user.id
    #       expect(response).to redirect_to root_path
    #     end
    #   end
    # end
  end
end