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

ActiveRecord::Schema.define(version: 20150602065539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "interval_count"
    t.string   "interval_type"
    t.integer  "amount"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "stripe_created"
    t.string   "uid"
    t.boolean  "livemode"
    t.integer  "trial_period_days"
    t.text     "meta_data",         default: [],              array: true
    t.boolean  "trial"
    t.string   "currency"
  end

  create_table "stripe_users", force: :cascade do |t|
    t.string   "access_token"
    t.boolean  "livemode"
    t.string   "refresh_token"
    t.integer  "user_id"
    t.string   "stripe_user_id"
    t.string   "stripe_publishable_key"
    t.string   "email"
    t.string   "business_url"
    t.string   "country"
    t.string   "phone_number"
    t.string   "business_name"
    t.string   "business_logo"
    t.string   "name"
    t.string   "default_currency"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "currencies_supported",   default: [],              array: true
    t.text     "timezone"
    t.boolean  "charge_enabled"
  end

  create_table "subscribers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "name"
    t.string   "email"
    t.string   "card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "invoice"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "subscriber_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
