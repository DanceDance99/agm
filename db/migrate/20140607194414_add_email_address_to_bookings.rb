class AddEmailAddressToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :email_address, :string
  end
end
