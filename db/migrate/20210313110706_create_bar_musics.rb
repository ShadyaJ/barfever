class CreateBarMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :bar_musics do |t|
      t.references :music, null: false, foreign_key: true
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
