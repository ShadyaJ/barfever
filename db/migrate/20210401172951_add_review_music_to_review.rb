class AddReviewMusicToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :review_music, :integer
  end
end
