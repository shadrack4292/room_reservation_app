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

ActiveRecord::Schema.define(version: 20151122001926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "num_of_rooms", default: 10, null: false
    t.string   "location"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "buildings", ["name"], name: "index_buildings_on_name", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "client_id"
    t.string   "client_type"
    t.integer  "room_id"
    t.string   "room_type"
  end

  add_index "reservations", ["client_type", "client_id"], name: "index_reservations_on_client_type_and_client_id", using: :btree
  add_index "reservations", ["room_type", "room_id"], name: "index_reservations_on_room_type_and_room_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "capacity",     default: 10, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "creator_id"
    t.string   "creator_type"
  end

  add_index "rooms", ["creator_type", "creator_id"], name: "index_rooms_on_creator_type_and_creator_id", using: :btree
  add_index "rooms", ["name"], name: "index_rooms_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin_flag",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end