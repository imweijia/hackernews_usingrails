class PostsController < ApplicationController
  include SessionsHelper

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.update_attributes(user: current_user)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
        if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end

  private
    def post_params
      params.require(:post).permit(:title, :external_url)
    end
end
