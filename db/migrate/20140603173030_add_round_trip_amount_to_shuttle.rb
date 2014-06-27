class AddRoundTripAmountToShuttle < ActiveRecord::Migration
  def change
    add_column :shuttles, :round_trip_amount, :integer
  end
end