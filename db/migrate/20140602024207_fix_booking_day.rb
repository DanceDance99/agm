class FixBookingDay < ActiveRecord::Migration
  def change
    remove_column :bookings, :day
    add_column :bookings, :date, :date
  end
end
