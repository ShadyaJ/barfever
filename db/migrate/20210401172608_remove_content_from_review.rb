class RemoveContentFromReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :content, :string
  end
end
