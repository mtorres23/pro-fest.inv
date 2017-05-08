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

ActiveRecord::Schema.define(version: 20170508183401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "company_id"
    t.integer  "access_key"
    t.text     "address"
    t.integer  "admin_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "prev_year_event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "client_id"
    t.integer  "admin_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "upc"
    t.text     "description"
    t.string   "color"
    t.string   "size"
    t.string   "dimension"
    t.string   "weight"
    t.float    "sale_price"
    t.float    "lowest_recorded_price"
    t.string   "images"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "location_id"
    t.integer  "qty"
    t.integer  "order_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "access_code"
    t.integer  "current_order_id"
    t.integer  "prev_order_id"
    t.string   "email"
    t.integer  "admin_id"
    t.integer  "event_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text     "content"
    t.integer  "created_by"
    t.integer  "verified_by"
    t.datetime "delivery_date"
    t.float    "total_price"
    t.integer  "total_amount"
    t.integer  "category_id"
    t.string   "type"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "title"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "visited_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_event_admin"
    t.boolean  "is_crew"
    t.boolean  "is_tent_manager"
    t.integer  "location_id",            default: 2
    t.integer  "client_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
