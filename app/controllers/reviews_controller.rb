class ReviewsController < ApplicationController
  def new
    @bar = Bar.find(params[:bar_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @bar = Bar.find(params[:bar_id])
    @review.bar = @bar
    if @review.save
      redirect_to bar_path(@bar)
    else
      # flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
