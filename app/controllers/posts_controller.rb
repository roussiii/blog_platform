class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id]) # find the post
    if @post.update(params_post)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  private

  def params_post
    params.require(:post).permit(:title, :content)
  end

end
