class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.references :user, foreign_key: true
      t.references :barrow, foreign_key: true

      t.timestamps
    end
  end
end
