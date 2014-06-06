class AddGroupAmountsToShuttle < ActiveRecord::Migration
  def change
    add_column :shuttles, :group_round_trip_amount, :integer
    add_column :shuttles, :group_amount, :integer
  end
end