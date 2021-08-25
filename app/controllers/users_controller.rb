class UsersController < ApplicationController
  # 各コントローラの各アクションで共通する処理(全アクションに適用しない場合)
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]} # onlyを用いて指定したアクションでのみメソッドが適用される
  before_action :forbid_login_user, {only: [:new, :create]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  # users機能のアクション
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました"
      redirect_to user_path
    else
      render("users/edit")
    end
  end

  # サインアップ(ユーザー登録)のアクション
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザの登録に成功しました"
      redirect_to("/posts/index")
    else
      render("users/new")
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
