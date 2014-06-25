class AddDropoffFieldsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :dest_address, :string
    add_column :bookings, :dest_city, :string
    add_column :bookings, :dest_zipcode, :string
  end
end
