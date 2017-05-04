class DirectorsController < ApplicationController
  def index
    @directors = Director.all

    render("directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])

    render("directors/show_details.html.erb")
  end

  def new_form

    render("directors/new_form.html.erb")
  end

  def create_row
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("show_details")
  end

  def edit_form
    @director = Director.find(params[:id])

    render("directors/edit_form.html.erb")
  end

  def update_row
    the_id = params[:id]

    new_dob = params[:dob]
    new_name = params[:name]
    new_bio = params[:bio]
    new_image_url = params[:image_url]

    Director.find(the_id).update_attribute(:dob,new_dob)
    Director.find(the_id).update_attribute(:name,new_name)
    Director.find(the_id).update_attribute(:bio,new_bio)
    Director.find(the_id).update_attribute(:image_url,new_image_url)

    redirect_to("/directors/#{the_id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
