class ChangeDataTypeForPrice < ActiveRecord::Migration[6.0]
  def change
    change_column :bars, :price, :string
  end
end
