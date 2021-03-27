class AddPhotosToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :photo_url_1, :string
  end
end
