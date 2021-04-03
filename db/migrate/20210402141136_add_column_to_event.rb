class AddColumnToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :price, :integer
  end
end
