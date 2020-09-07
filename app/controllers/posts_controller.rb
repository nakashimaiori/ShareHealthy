class PostsController < ApplicationController

  def new
  	@post = Post.new
  	@genres = Genre.all
  end

  def create
  	@post = Post.new(post_params)
    @genres = Genre.all
    @post.genre_id = params[:genre][:name]
    @post.user_id = current_user.id
    if @post.save
      # flash[:notice] = "successfully"
      redirect_to post_path(@post.id)
    else
      render action: :new
    end
  end

  def show
  	@post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
  	@posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    if @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
