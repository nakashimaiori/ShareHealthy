class HomesController < ApplicationController
  def top
    @tag_list = Tag.all.limit(30)
  end

  def about
  end

  def new_guest
    user = User.find_or_create_by!(email: 'gues@gmail.com', name: 'ゲスト') do |u|
      u.password = "gestgest"
    end
    sign_in user
    redirect_to user_path(current_user), notice: 'ゲストユーザーとしてログインしました。'
  end
end
