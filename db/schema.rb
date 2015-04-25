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

ActiveRecord::Schema.define(version: 20150424024359) do

  create_table "favorite_stations", force: :cascade do |t|
    t.integer "user_id"
  end

  add_index "favorite_stations", ["user_id"], name: "index_favorite_stations_on_user_id"

  create_table "flow_readings", force: :cascade do |t|
    t.datetime "date_time"
    t.decimal  "flow_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  add_index "flow_readings", ["station_id"], name: "index_flow_readings_on_station_id"

  create_table "forecasts", force: :cascade do |t|
    t.integer  "station_id"
    t.date     "date"
    t.decimal  "mintemp"
    t.decimal  "maxtemp"
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "code",       limit: 10
    t.integer  "user_id"
  end

  add_index "stations", ["user_id"], name: "index_stations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
