class RemoveHotelNameFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :hotel_name, :string
  end
end
