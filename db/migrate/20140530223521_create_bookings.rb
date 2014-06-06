class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer  "passengers"
      t.boolean  "home_pickup",      default: false
      t.boolean  "home_dropoff",     default: false
      t.text     "home_address"
      t.integer  "zipcode"
      t.string   "telephone_number"
      t.string   "day"
      t.string   "hotel_name"
      t.string   "first_last_name"
      t.string   "phone_number"

      t.integer  "shuttle_id"
      t.timestamps
    end
  end
end
