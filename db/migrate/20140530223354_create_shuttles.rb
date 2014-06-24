class CreateShuttles < ActiveRecord::Migration
  def change
    create_table :shuttles do |t|
      t.string   "name"
      t.integer  "amount"
      t.string   "start_date"
      t.string   "days"

      t.timestamps
    end
  end
end
