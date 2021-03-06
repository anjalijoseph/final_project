class RestaurantsController < ApplicationController
  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(:distinct => true).includes(:restaurant_reviews).page(params[:page]).per(10)

    render("restaurant_templates/index.html.erb")
  end

  def show
    @restaurant_review = RestaurantReview.new
    @restaurant = Restaurant.find(params.fetch("id_to_display"))

    render("restaurant_templates/show.html.erb")
  end

  def new_form
    @restaurant = Restaurant.new

    render("restaurant_templates/new_form.html.erb")
  end

  def create_row
    @restaurant = Restaurant.new

    @restaurant.restaurant_name = params.fetch("restaurant_name")
    @restaurant.restaurant_address = params.fetch("restaurant_address")
    @restaurant.outdoor_seating = params.fetch("outdoor_seating")

    if @restaurant.valid?
      @restaurant.save

      redirect_back(:fallback_location => "/restaurants", :notice => "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant = Restaurant.find(params.fetch("prefill_with_id"))

    render("restaurant_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant = Restaurant.find(params.fetch("id_to_modify"))

    @restaurant.restaurant_name = params.fetch("restaurant_name")
    @restaurant.restaurant_address = params.fetch("restaurant_address")
    @restaurant.outdoor_seating = params.fetch("outdoor_seating")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/restaurants", :notice => "Restaurant deleted successfully.")
  end
end
