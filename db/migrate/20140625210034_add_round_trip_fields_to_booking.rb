class AddRoundTripFieldsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :round_trip_source_address, :string
    add_column :bookings, :round_trip_source_city, :string
    add_column :bookings, :round_trip_source_zipcode, :string
    add_column :bookings, :round_trip_dest_address, :string
    add_column :bookings, :round_trip_dest_city, :string
    add_column :bookings, :round_trip_dest_zipcode, :string
  end
end
