class PostsController < ApplicationController
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
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to posts_index_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
