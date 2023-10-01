class PostsController < ApplicationController
  def index
    # @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def params_post
    params.require(:post).permit(:title, :content)
  end

end
