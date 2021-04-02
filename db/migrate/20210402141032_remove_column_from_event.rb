class RemoveColumnFromEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :price, :decimal
  end
end
