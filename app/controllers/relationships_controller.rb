class RelationshipsController < ApplicationController
  # def create
  #   follow = current_user.active_relationships.build(follower_id: params[:user_id])
  #   follow.save
  #   redirect_to request.referer
  # end

  # def destroy
  #   follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  #   follow.destroy
  #   redirect_to request.referer
  # end

  def create
    @follow = current_user.active_relationships.build(follower_id: params[:user_id])
    # 通知機能（userはフォローされた人）
    # フォロー機能（非同期）
    @user = User.find(params[:user_id])
    @follow.save
  end

  def destroy
    # フォロー機能（非同期）
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    @follow.destroy
    redirect_back(fallback_location: root_path)
  end
end
