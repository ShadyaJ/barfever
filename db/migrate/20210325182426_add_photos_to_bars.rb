class AddPhotosToBars < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :photo_url_1, :string
    add_column :bars, :photo_url_2, :string
  end
end
