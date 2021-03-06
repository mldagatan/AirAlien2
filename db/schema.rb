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

ActiveRecord::Schema.define(version: 20170511092835) do

  create_table "activities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "title"
    t.string   "subtitle"
    t.text     "what_to_do"
    t.text     "where_well_be"
    t.text     "notes"
    t.integer  "experience_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "location_name"
    t.string   "country"
    t.string   "street_address"
    t.string   "building"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
  end

  add_index "activities", ["experience_id"], name: "index_activities_on_experience_id"

  create_table "activityaddresses", force: :cascade do |t|
    t.integer  "activity_id"
    t.string   "location_name"
    t.string   "country"
    t.string   "street_address"
    t.string   "building"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "activityaddresses", ["activity_id"], name: "index_activityaddresses_on_activity_id"

  create_table "activityitems", force: :cascade do |t|
    t.string   "item_type"
    t.text     "item_description"
    t.integer  "activity_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "activityitems", ["activity_id"], name: "index_activityitems_on_activity_id"

  create_table "activitytobrings", force: :cascade do |t|
    t.string   "item_name"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activitytobrings", ["activity_id"], name: "index_activitytobrings_on_activity_id"

  create_table "experiences", force: :cascade do |t|
    t.string   "day_type"
    t.string   "city"
    t.string   "category"
    t.string   "language"
    t.string   "experience_name"
    t.string   "experience_tagline"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "host_bio"
    t.integer  "max_guests"
    t.integer  "price"
    t.string   "price_currency"
    t.integer  "prep_time"
    t.integer  "cutoff_time"
    t.text     "context_for_guests"
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id"

  create_table "expphotos", force: :cascade do |t|
    t.integer  "experience_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "expphotos", ["experience_id"], name: "index_expphotos_on_experience_id"

  create_table "exprequires", force: :cascade do |t|
    t.boolean  "is_legal"
    t.text     "certification"
    t.text     "extra_require"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exprequires", ["experience_id"], name: "index_exprequires_on_experience_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
