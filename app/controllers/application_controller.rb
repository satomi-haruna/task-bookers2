class ApplicationController < ActionController::Base
  # ユーザ登録・ログイン認証の前にメソッドか実行される
  # ログインしていないと、ログイン画面へリダイレクトする
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
      books_path
    end

    # aboutページをサインアウト後の遷移先に設定
    def after_sign_out_path_for(resource_or_scope)
      user_session_path
    end



  protected

  # nameのデータを保存できるよう、許可を与える
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end

end
