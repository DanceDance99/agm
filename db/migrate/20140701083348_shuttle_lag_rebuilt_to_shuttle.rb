class ShuttleLagRebuiltToShuttle < ActiveRecord::Migration
  def change
    add_column :shuttles, :shuttle_lag_rebuilt, :boolean, default: true

    Shuttle.all.update_all(shuttle_lag_rebuilt: true)
  end
end
