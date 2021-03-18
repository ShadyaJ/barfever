class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :bar

      t.timestamps
    end
  end
end
