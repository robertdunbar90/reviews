class ReviewsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @review = @item.reviews.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = @item.reviews.new(review_params)

    @review.save
    redirect_to @item
  end

  private

    def review_params
      params.require(:review).permit(:review, :rating, :reviewer)
    end

end