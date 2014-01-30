class ReviewController < ApplicationController

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.where(restaurant_id: @restaurant.id, user_id: current_user.id).first
    @review = Review.new unless @review
  end

  def update
    @review = Review.find_or_create_by_restaurant_id_and_user_id(params[:restaurant_id], current_user.id)
    puts "params:::::::::::::::::::::::::::::::::::::::::::::: #{params}"
    @review.comment = params[:review][:comment]
    @review.rating = params[:review][:rating].to_i
    @review.save!
    redirect_to restaurant_path(params[:restaurant_id])
  end
end
