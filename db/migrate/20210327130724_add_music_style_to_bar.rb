class AddMusicStyleToBar < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :music_style, :string
  end
end
