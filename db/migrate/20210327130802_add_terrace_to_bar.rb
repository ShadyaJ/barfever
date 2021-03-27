class AddTerraceToBar < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :terrace, :boolean
  end
end
