class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])

    render("movies/show.html.erb")
  end

  def new_form

    render("movies/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])

    render("movies/edit_form.html.erb")
  end

  def update_row
    the_id = params[:id]
    new_title = params[:title]
    new_year = params[:year]
    new_duration = params[:duration]
    new_description = params[:description]
    new_image_url = params[:image_url]
    new_director_id = params[:director_id]

    Movie.find(the_id).update_attribute(:title,new_title)
    Movie.find(the_id).update_attribute(:year,new_year)
    Movie.find(the_id).update_attribute(:duration,new_duration)
    Movie.find(the_id).update_attribute(:description,new_description)
    Movie.find(the_id).update_attribute(:image_url,new_image_url)
    Movie.find(the_id).update_attribute(:director_id,new_director_id)

    redirect_to("/movies/#{the_id}")
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    render("/movies/destroy.html.erb")
  end
end
