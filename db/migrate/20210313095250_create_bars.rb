class CreateBars < ActiveRecord::Migration[6.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :category
      t.text :description
      t.decimal :price
      t.string :music_style
      t.string :address_street
      t.string :address_zipcode
      t.string :address_city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
