class AddAmountToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :amount, :integer
    add_column :bookings, :senior_citizen, :boolean
    add_column :bookings, :private_shuttle, :boolean
  end
end