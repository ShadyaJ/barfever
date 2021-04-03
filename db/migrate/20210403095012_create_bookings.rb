class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :bar, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.boolean :type

      t.timestamps
    end
  end
end
