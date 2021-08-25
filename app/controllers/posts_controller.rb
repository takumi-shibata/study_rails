class PostsController < ApplicationController
  # 各コントローラの各アクションで共通する処理(全アクションに適用しない場合)
  before_action :authenticate_user

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(content: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to posts_index_path
    else
      render("posts/new")
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集に成功しました"
      redirect_to posts_index_path
    else
      render("posts/edit")
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    flash[:notice] = "削除に成功しました"
    redirect_to posts_index_path    
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
