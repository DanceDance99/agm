class AddOneWayToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :round_trip, :boolean
    add_column :bookings, :from_id, :integer
    add_column :bookings, :to_id, :integer

  end
end