class AddAdminReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :added_by_admin, :boolean
  end
end
