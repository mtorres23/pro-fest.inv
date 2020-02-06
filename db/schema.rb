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

ActiveRecord::Schema.define(version: 20200206220546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :bigserial, force: :cascade do |t|
    t.string   "company_id"
    t.integer  "account_access_key"
    t.text     "address"
    t.integer  "admin_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.string   "role"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_assignments_on_event_id", using: :btree
    t.index ["location_id"], name: "index_assignments_on_location_id", using: :btree
    t.index ["user_id"], name: "index_assignments_on_user_id", using: :btree
  end

  create_table "bins", id: :bigserial, force: :cascade do |t|
    t.integer  "qty"
    t.datetime "last_updated"
    t.integer  "last_order"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["account_id"], name: "index_customers_on_account_id", using: :btree
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
    t.integer  "admin_id"
    t.integer  "account_id"
    t.integer  "customer_id"
    t.index ["account_id"], name: "index_events_on_account_id", using: :btree
    t.index ["customer_id"], name: "index_events_on_customer_id", using: :btree
  end

  create_table "items", id: :bigserial, force: :cascade do |t|
    t.float    "sale_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "product_id"
    t.string   "category"
    t.integer  "quantity"
    t.index ["location_id"], name: "index_items_on_location_id", using: :btree
    t.index ["product_id"], name: "index_items_on_product_id", using: :btree
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

  create_table "products", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "upc"
    t.text     "description"
    t.string   "color"
    t.string   "size"
    t.string   "dimensions"
    t.string   "weight"
    t.float    "highest_recorded_price"
    t.float    "lowest_recorded_price"
    t.string   "image_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "brand"
    t.string   "model_number"
    t.string   "asin"
    t.string   "measure"
    t.string   "unit"
    t.integer  "units_per_item"
    t.float    "width"
    t.float    "length"
    t.float    "height"
    t.integer  "account_id"
    t.index ["account_id"], name: "index_products_on_account_id", using: :btree
  end

  create_table "transactions", id: :bigserial, force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "origin_id"
    t.integer  "dest_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "qty"
    t.integer  "item_id"
    t.index ["item_id"], name: "index_transactions_on_item_id", using: :btree
    t.index ["order_id"], name: "index_transactions_on_order_id", using: :btree
  end

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "email",                  default: "", null: false
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
    t.integer  "location_id",            default: 2
    t.string   "encrypted_password",     default: ""
    t.integer  "account_id"
    t.integer  "permission_level"
    t.string   "pin_number"
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "assignments", "events"
  add_foreign_key "assignments", "locations"
  add_foreign_key "assignments", "users"
  add_foreign_key "customers", "accounts"
  add_foreign_key "events", "accounts"
  add_foreign_key "orders", "locations"
  add_foreign_key "products", "accounts"
  add_foreign_key "transactions", "orders"
  add_foreign_key "users", "accounts"
end
