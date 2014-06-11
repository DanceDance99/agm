# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140611000945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: true do |t|
    t.integer  "passengers"
    t.boolean  "home_pickup",      default: false
    t.boolean  "home_dropoff",     default: false
    t.text     "home_address"
    t.integer  "zipcode"
    t.string   "telephone_number"
    t.string   "first_last_name"
    t.string   "phone_number"
    t.integer  "shuttle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "depart_date"
    t.boolean  "round_trip"
    t.integer  "from_id"
    t.integer  "to_id"
    t.date     "return_date"
    t.integer  "amount"
    t.boolean  "senior_citizen"
    t.boolean  "private_shuttle"
    t.boolean  "added_by_admin"
    t.string   "email_address"
  end

  create_table "reservations", force: true do |t|
    t.integer  "passengers"
    t.string   "telephone_number"
    t.string   "hotel_name"
    t.string   "first_last_name"
    t.integer  "tour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.boolean  "added_by_admin"
    t.string   "email_address"
  end

  create_table "shuttle_cities", force: true do |t|
    t.integer  "shuttle_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "shuttle_legs", force: true do |t|
    t.integer  "shuttle_id"
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "capacity"
    t.integer  "available"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shuttles", force: true do |t|
    t.string   "name"
    t.integer  "amount"
    t.string   "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_bits",                default: 0, null: false
    t.integer  "round_trip_amount"
    t.integer  "group_round_trip_amount"
    t.integer  "group_amount"
  end

  create_table "tour_dates", force: true do |t|
    t.integer  "tour_id"
    t.date     "date"
    t.integer  "capacity"
    t.integer  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", force: true do |t|
    t.string   "name"
    t.integer  "amount"
    t.string   "time"
    t.string   "location"
    t.string   "duration"
    t.text     "description"
    t.text     "highlights"
    t.string   "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_bits",    default: 0, null: false
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "password_digest"
  end

end
