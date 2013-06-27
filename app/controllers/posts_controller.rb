class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to root_path, notice: "Post created successfully!"
    else
      flash[:error] = "You need to provide valid attributes!"
      render :new
    end
  end

  def publish
    @post = Post.find(params[:post_id])
    @post.publish

    if @post.save
      redirect_to posts_path
    else
      redirect_to post_path(@post)
    end
  end
end
