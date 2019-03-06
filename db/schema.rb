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

ActiveRecord::Schema.define(version: 20190306031546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bins", id: :bigserial, force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "qty"
    t.datetime "last_updated"
    t.integer  "last_order"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["item_id"], name: "index_bins_on_item_id", using: :btree
    t.index ["location_id"], name: "index_bins_on_location_id", using: :btree
  end

  create_table "clients", id: :bigserial, force: :cascade do |t|
    t.string   "company_id"
    t.integer  "access_key"
    t.text     "address"
    t.integer  "admin_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :bigserial, force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "prev_year_event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "client_id"
    t.integer  "admin_id"
  end

  create_table "items", id: :bigserial, force: :cascade do |t|
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
    t.integer  "client_id"
    t.index ["client_id"], name: "index_items_on_client_id", using: :btree
  end

  create_table "locations", id: :bigserial, force: :cascade do |t|
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
    t.string   "loc_type"
  end

  create_table "orders", id: :bigserial, force: :cascade do |t|
    t.integer  "created_by"
    t.integer  "verified_by"
    t.datetime "delivery_date"
    t.float    "total_price"
    t.integer  "total_amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "role"
    t.text     "message"
    t.integer  "location_id"
    t.index ["location_id"], name: "index_orders_on_location_id", using: :btree
  end

  create_table "transactions", id: :bigserial, force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.integer  "origin_id"
    t.integer  "dest_id"
    t.string   "status"
    t.integer  "bin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "qty"
    t.index ["bin_id"], name: "index_transactions_on_bin_id", using: :btree
    t.index ["item_id"], name: "index_transactions_on_item_id", using: :btree
    t.index ["order_id"], name: "index_transactions_on_order_id", using: :btree
  end

  create_table "users", id: :bigserial, force: :cascade do |t|
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
    t.float    "latitude"
    t.float    "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bins", "items"
  add_foreign_key "bins", "locations"
  add_foreign_key "items", "clients"
  add_foreign_key "orders", "locations"
  add_foreign_key "transactions", "bins"
  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "orders"
end
