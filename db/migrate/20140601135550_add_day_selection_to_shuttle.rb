class AddDaySelectionToShuttle < ActiveRecord::Migration
  def change
    add_column :shuttles, "day_bits", :integer, {:null => false, :default => 0}
    remove_column :shuttles, :days
  end
end
