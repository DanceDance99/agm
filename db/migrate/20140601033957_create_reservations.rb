class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer  "passengers"
      t.string   "telephone_number"
      t.string   "hotel_name"
      t.string   "first_last_name"
      t.integer  "tour_id"
      t.string   "day"

      t.timestamps
    end
  end
end
