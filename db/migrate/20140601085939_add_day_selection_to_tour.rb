class AddDaySelectionToTour < ActiveRecord::Migration
  def change
    add_column :tours, "day_bits", :integer, {:null => false, :default => 0}
  end
end