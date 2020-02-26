class AddBookingDateToBarrow < ActiveRecord::Migration[5.2]
  def change
    add_column :barrows, :booking_date, :date
  end
end
