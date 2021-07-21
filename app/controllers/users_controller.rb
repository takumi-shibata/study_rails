class UsersController < ApplicationController
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

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
