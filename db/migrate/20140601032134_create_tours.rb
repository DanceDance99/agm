class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string   "name"
      t.integer  "amount"
      t.string   "time"
      t.string   "location"
      t.string   "duration"
      t.text     "description"
      t.string   "highlights"
      t.string   "start_date"
      t.string   "days"

      t.timestamps
    end
  end
end
