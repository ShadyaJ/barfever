class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :bar, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.boolean :table_booking?

      t.timestamps
    end
  end
end
