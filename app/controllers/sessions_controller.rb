class SessionsController < ApplicationController
  # 各コントローラの各アクションで共通する処理
  before_action :forbid_login_user, {only: [:login_form, :login]} # onlyを用いて指定したアクションでのみメソッドが適用される

  # アカウント認証機能のアクション
  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id # 特定のユーザのidをsession変数に代入することで、特定のログインユーザの情報をブラウザに保存する
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが異なります"
      render("sessions/login_form")
    end
  end

  def logout
    session[:user_id] = nil # session変数に代入されている値をnil(空)にしてログアウト状態にする
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
end
