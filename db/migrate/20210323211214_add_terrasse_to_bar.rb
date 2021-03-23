class AddTerrasseToBar < ActiveRecord::Migration[6.0]
  def change
    add_column :bars, :terrasse, :boolean
  end
end
