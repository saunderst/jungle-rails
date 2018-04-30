class ReviewsController < ApplicationController
  before_action :check_logged_in

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    save_result = @review.save
    redirect_to product_path(@review.product)
  end

  def destroy
    @review = Review.find params[:id]
    product = @review.product
    @review.destroy!
    redirect_to product_path(product)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def check_logged_in
    unless current_user
      redirect_to '/register'
    end
  end
end
