class AddReviewExperienceToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :review_experience, :integer
  end
end
