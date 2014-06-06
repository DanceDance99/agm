class OrderShuttleCities < ActiveRecord::Migration
  def change
    add_column :shuttle_cities, :position, :integer
  end
end