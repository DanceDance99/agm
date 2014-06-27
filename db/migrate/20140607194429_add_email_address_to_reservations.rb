class AddEmailAddressToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :email_address, :string
  end
end
