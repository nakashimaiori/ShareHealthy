class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters,if: :devise_controller?

before_action :set_search

  def set_search
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end
private

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
end

end
