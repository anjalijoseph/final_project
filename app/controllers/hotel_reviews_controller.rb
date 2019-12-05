class HotelReviewsController < ApplicationController
  before_action :current_user_must_be_hotel_review_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_hotel_review_user
    hotel_review = HotelReview.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == hotel_review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = HotelReview.ransack(params[:q])
    @hotel_reviews = @q.result(:distinct => true).includes(:user, :hotel).page(params[:page]).per(10)

    render("hotel_review_templates/index.html.erb")
  end

  def show
    @hotel_review = HotelReview.find(params.fetch("id_to_display"))

    render("hotel_review_templates/show.html.erb")
  end

  def new_form
    @hotel_review = HotelReview.new

    render("hotel_review_templates/new_form.html.erb")
  end

  def create_row
    @hotel_review = HotelReview.new

    @hotel_review.hotel_id = params.fetch("hotel_id")
    @hotel_review.user_id = params.fetch("user_id")

    if @hotel_review.valid?
      @hotel_review.save

      redirect_back(:fallback_location => "/hotel_reviews", :notice => "Hotel review created successfully.")
    else
      render("hotel_review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_hotel
    @hotel_review = HotelReview.new

    @hotel_review.hotel_id = params.fetch("hotel_id")
    @hotel_review.user_id = params.fetch("user_id")

    if @hotel_review.valid?
      @hotel_review.save

      redirect_to("/hotels/#{@hotel_review.hotel_id}", notice: "HotelReview created successfully.")
    else
      render("hotel_review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @hotel_review = HotelReview.find(params.fetch("prefill_with_id"))

    render("hotel_review_templates/edit_form.html.erb")
  end

  def update_row
    @hotel_review = HotelReview.find(params.fetch("id_to_modify"))

    @hotel_review.hotel_id = params.fetch("hotel_id")
    

    if @hotel_review.valid?
      @hotel_review.save

      redirect_to("/hotel_reviews/#{@hotel_review.id}", :notice => "Hotel review updated successfully.")
    else
      render("hotel_review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @hotel_review = HotelReview.find(params.fetch("id_to_remove"))

    @hotel_review.destroy

    redirect_to("/users/#{@hotel_review.user_id}", notice: "HotelReview deleted successfully.")
  end

  def destroy_row_from_hotel
    @hotel_review = HotelReview.find(params.fetch("id_to_remove"))

    @hotel_review.destroy

    redirect_to("/hotels/#{@hotel_review.hotel_id}", notice: "HotelReview deleted successfully.")
  end

  def destroy_row
    @hotel_review = HotelReview.find(params.fetch("id_to_remove"))

    @hotel_review.destroy

    redirect_to("/hotel_reviews", :notice => "Hotel review deleted successfully.")
  end
end
