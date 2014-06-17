class ChangeHotelNameToPickupLocationOnReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :hotel_name, :pickup_location
  end
end
