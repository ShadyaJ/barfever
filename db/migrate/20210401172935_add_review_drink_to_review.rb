class AddReviewDrinkToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :review_drink, :integer
  end
end
