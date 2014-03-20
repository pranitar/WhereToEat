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

ActiveRecord::Schema.define(version: 20140320013151) do

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
    t.string   "address"
    t.integer  "zip_code"
    t.string   "cuisine"
    t.string   "area"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
