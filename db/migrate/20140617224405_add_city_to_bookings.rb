class AddCityToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :pickup_city, :string
  end
end
