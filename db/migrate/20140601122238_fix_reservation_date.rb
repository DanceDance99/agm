class FixReservationDate < ActiveRecord::Migration
  def change
    remove_column :reservations, :day
    add_column :reservations, :date, :date
  end
end