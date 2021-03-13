class RemoveMusicstyleToBars < ActiveRecord::Migration[6.0]
  def change
    remove_column :bars, :music_style
  end
end
