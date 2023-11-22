class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # respond_to do |format|
    #   if @review.save
    #     format.html { redirect_to restaurant_url(@restaurant), notice: "Votre avis a bien été pris en compte !" }
    #     format.json { render :show, status: :created, location: @restaurant }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @restaurants.errors, status: :unprocessable_entity }
    #   end
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
