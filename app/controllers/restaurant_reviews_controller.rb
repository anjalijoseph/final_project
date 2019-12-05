class RestaurantReviewsController < ApplicationController
  def index
    @restaurant_reviews = RestaurantReview.all

    render("restaurant_review_templates/index.html.erb")
  end

  def show
    @restaurant_review = RestaurantReview.find(params.fetch("id_to_display"))

    render("restaurant_review_templates/show.html.erb")
  end

  def new_form
    @restaurant_review = RestaurantReview.new

    render("restaurant_review_templates/new_form.html.erb")
  end

  def create_row
    @restaurant_review = RestaurantReview.new

    @restaurant_review.restaurant_id = params.fetch("restaurant_id")
    @restaurant_review.user_id = params.fetch("user_id")

    if @restaurant_review.valid?
      @restaurant_review.save

      redirect_back(:fallback_location => "/restaurant_reviews", :notice => "Restaurant review created successfully.")
    else
      render("restaurant_review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant_review = RestaurantReview.find(params.fetch("prefill_with_id"))

    render("restaurant_review_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant_review = RestaurantReview.find(params.fetch("id_to_modify"))

    @restaurant_review.restaurant_id = params.fetch("restaurant_id")
    @restaurant_review.user_id = params.fetch("user_id")

    if @restaurant_review.valid?
      @restaurant_review.save

      redirect_to("/restaurant_reviews/#{@restaurant_review.id}", :notice => "Restaurant review updated successfully.")
    else
      render("restaurant_review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @restaurant_review = RestaurantReview.find(params.fetch("id_to_remove"))

    @restaurant_review.destroy

    redirect_to("/users/#{@restaurant_review.user_id}", notice: "RestaurantReview deleted successfully.")
  end

  def destroy_row_from_restaurant
    @restaurant_review = RestaurantReview.find(params.fetch("id_to_remove"))

    @restaurant_review.destroy

    redirect_to("/restaurants/#{@restaurant_review.restaurant_id}", notice: "RestaurantReview deleted successfully.")
  end

  def destroy_row
    @restaurant_review = RestaurantReview.find(params.fetch("id_to_remove"))

    @restaurant_review.destroy

    redirect_to("/restaurant_reviews", :notice => "Restaurant review deleted successfully.")
  end
end
