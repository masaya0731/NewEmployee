class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後
  def after_sign_up_path_for(resource)
    flash[:notice] = "新規ユーザー登録しました"
   root_path
  end

  # ログイン後
  def after_sign_in_path_for(resource)
    flash[:notice] = "　ログインしました　"
    root_path
  end

  # ログアウト後
  def after_sign_out_path_for(resource)
    flash[:notice] = "　ログアウトしました　"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name introduction profile_image])
  end
end
