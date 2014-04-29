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

ActiveRecord::Schema.define(version: 20140429090423) do

  create_table "business_hours", force: true do |t|
    t.time     "open_at"
    t.time     "closed_at"
    t.string   "day"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_hours", ["restaurant_id"], name: "index_business_hours_on_restaurant_id"

  create_table "check_ins", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "time"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "check_ins", ["restaurant_id"], name: "index_check_ins_on_restaurant_id"
  add_index "check_ins", ["user_id"], name: "index_check_ins_on_user_id"

  create_table "item_reviews", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "review"
    t.integer  "rating"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_reviews", ["item_id"], name: "index_item_reviews_on_item_id"
  add_index "item_reviews", ["restaurant_id"], name: "index_item_reviews_on_restaurant_id"
  add_index "item_reviews", ["user_id"], name: "index_item_reviews_on_user_id"

  create_table "items", force: true do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["menu_id"], name: "index_items_on_menu_id"

  create_table "menus", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id"

  create_table "restaurant_reviews", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.string   "review"
    t.integer  "rating"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_reviews", ["restaurant_id"], name: "index_restaurant_reviews_on_restaurant_id"
  add_index "restaurant_reviews", ["user_id"], name: "index_restaurant_reviews_on_user_id"

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "cuisine"
    t.string   "area"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accepts_dinex"
    t.boolean  "accepts_cash"
    t.boolean  "accepts_credit"
    t.boolean  "accepts_plaid_cash"
    t.integer  "price"
    t.integer  "waiting_time"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "location_last_updated_at"
    t.datetime "location_updated_at"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
