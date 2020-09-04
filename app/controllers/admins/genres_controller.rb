class Admins::GenresController < ApplicationController
  def show
  end

  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	   redirect_to admins_genres_path
  	else
  	  @genres = Genre.all
  	  render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  	@genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit :name
  end

end
