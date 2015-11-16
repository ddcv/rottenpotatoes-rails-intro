class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def defaults
	defaults = {'G': 1, 'PG': 1, 'PG-13': 1, 'R': 1}
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
		if params[:sorter].nil?
			if session[:sorter].nil?
				sorter = 'title'
			end
			sorter = session[:sorter]
		else
			sorter = params[:sorter]
			session[:sorter] = sorter
		end
		if params[:ratings].nil?
			if session[:ratings].nil?
				session[:ratings] = defaults
			end
			visible_ratings = session[:ratings]
		else
			visible_ratings = params[:ratings]
			session[:ratings] = visible_ratings	
		end
#		redirect_to movies_path(:sorter =>sorter, :ratings => visible_ratings)
	@all_ratings = Movie.all_ratings

	@visible_ratings = visible_ratings.keys
#	session[:visible_ratings] = @visible_ratings
	flash[:notice] = "Movies sorted by #{params[:sorter]} #{@visible_ratings}"
	@movies = Movie.where('rating' => @visible_ratings).order(sorter)

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
