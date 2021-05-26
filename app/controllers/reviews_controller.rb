class ReviewsController < ApplicationController

  def new
   @restaurant = Restaurant.find(params[:restaurant_id])
   @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_strong_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render :new
    end
  end


  private

  def review_strong_params
    params.require(:review).permit(:rating, :content)
  end
end
