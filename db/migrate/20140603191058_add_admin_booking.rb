class AddAdminBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :added_by_admin, :boolean
  end
end