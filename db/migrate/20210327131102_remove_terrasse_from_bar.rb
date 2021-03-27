class RemoveTerrasseFromBar < ActiveRecord::Migration[6.0]
  def change
    remove_column :bars, :terrasse, :boolean
  end
end
