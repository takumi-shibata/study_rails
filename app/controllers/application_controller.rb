class ApplicationController < ActionController::Base
    # 全アクションで共通する処理(before_actionは他のアクションを呼び出す前に先行して呼び出す)
    before_action :current_user
    
    # 全てのコントローラで共通する処理がある場合はapplicationコントローラにまとめる
    def current_user # 現在のユーザー
      @current_user = User.find_by(id: session[:user_id]) # usersテーブルのidカラムの値がsession[:user_id](ログインしているユーザーのid)と等しいユーザー情報を取得する
    end

    def authenticate_user # ユーザの認証
      if @current_user == nil # 現在のユーザーとnilが等しいならば(ユーザーがログインしていなければログイン後のページにアクセスできない)
        flash[:notice] = "ログインもしくはサインアップを行ってください"
        redirect_to("/login")
      end
    end 

    def forbid_login_user # ログインユーザーの禁止
      if @current_user
        flash[:notice] = "既にログイン済みです"
        redirect_to("/posts/index")
      end
    end

    def ensure_correct_user # 正しいユーザーであるか確認
      if @current_user.id != params[:id].to_i # ログイン中のユーザーidと編集したいユーザーのidが異なる場合(params[:id]で取得できる値は文字列であるため.to_iで数値に置き換えている)
        flash[:notice] = "他のユーザー情報を編集することは出来ません"
        redirect_to users_path
      end
    end
end
