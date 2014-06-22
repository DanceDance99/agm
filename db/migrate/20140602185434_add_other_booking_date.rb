class AddOtherBookingDate < ActiveRecord::Migration
  def change
    rename_column :bookings, :date, :depart_date
    add_column :bookings, :return_date, :date
  end
end