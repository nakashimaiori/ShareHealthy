class PostsController < ApplicationController

  def new
  	@post = Post.new
  	@genres = Genre.all

  end

  def create
  	@post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    @genres = Genre.all
    @post.genre_id = params[:genre][:name]
    @post.user_id = current_user.id
    if @post.save
      @post.save_tag(tag_list)
      # flash[:notice] = "successfully"
      redirect_to post_path(@post.id)
    else
      render action: :new
    end
  end

  def show
  	@post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
    @post_tags = @post.tags
  end

  def index
    @genres = Genre.all
    @tag_list = Tag.all
    # @post = current_user.posts.new
  	 @posts = Post.all.order(id: "DESC")
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
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
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

  def search
    @tag_list = Tag.all
    @posts = Post.where(genre_id: params[:id]).order(id: "DESC")
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    render :index
  end

  def select
    @tag_list = Tag.all
    @posts = Post.where(genre_id: params[:id]).order(id: "DESC")
    @genres = Genre.all
    @selection = params[:keyword]
    @select_posts = Post.sort(@selection)
  end

  def tagsearch
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all.order(id: "DESC")        #クリックしたタグに紐付けられた投稿を全て表示
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
