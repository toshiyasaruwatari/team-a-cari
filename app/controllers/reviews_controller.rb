class ReviewsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    Review.create(review_params)
    @item[:trade] = "売却済"
    @item.save
    redirect_to :root, notice: "Thank you!"
  end


  private
  def review_params
    @item = Item.find(params[:item_id])
    if @item.seller_id == current_user.id
    params.require(:review).permit(:review).merge(giver_id: current_user.id,taker_id: @item.buyer_id)
    else
    params.require(:review).permit(:review).merge(giver_id: current_user.id,taker_id: @item.seller_id)
    end
  end
end
