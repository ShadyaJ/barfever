class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string  :category
      t.text    :description
      t.string  :name
      t.decimal :price
      t.date    :date
      t.belongs_to :bar

      t.timestamps
    end
  end
end
