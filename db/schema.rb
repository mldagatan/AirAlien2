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

ActiveRecord::Schema.define(version: 20170609024517) do

  create_table "activities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "title"
    t.string   "subtitle"
    t.text     "what_to_do"
    t.string   "where_well_be"
    t.text     "notes"
    t.string   "location_name"
    t.string   "country"
    t.string   "street_address"
    t.string   "building"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "experience_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "activities", ["experience_id"], name: "index_activities_on_experience_id"

  create_table "actphotos", force: :cascade do |t|
    t.integer  "activity_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "actphotos", ["activity_id"], name: "index_actphotos_on_activity_id"

  create_table "addresses", force: :cascade do |t|
    t.text     "first_line"
    t.text     "second_line"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.integer  "address_type"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"

  create_table "administrators", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "user_level",             default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true

  create_table "answers", force: :cascade do |t|
    t.text     "answer"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "approvals", force: :cascade do |t|
    t.string   "government_id_type"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "government_id_file_name"
    t.string   "government_id_content_type"
    t.integer  "government_id_file_size"
    t.datetime "government_id_updated_at"
  end

  add_index "approvals", ["user_id"], name: "index_approvals_on_user_id"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

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
    t.float    "latitude"
    t.float    "longitude"
    t.text     "host_bio"
    t.integer  "price"
    t.string   "price_currency"
    t.integer  "prep_time"
    t.integer  "cutoff_time"
    t.text     "context_for_guests"
    t.integer  "max_guests"
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

  create_table "expreservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experience_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "status"
  end

  add_index "expreservations", ["experience_id"], name: "index_expreservations_on_experience_id"
  add_index "expreservations", ["user_id"], name: "index_expreservations_on_user_id"

  create_table "images", force: :cascade do |t|
    t.text     "description"
    t.string   "dimensions"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "type"
    t.integer  "status"
    t.text     "description"
    t.text     "parameters"
    t.integer  "payable_id"
    t.string   "payable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "payments", ["payable_type", "payable_id"], name: "index_payments_on_payable_type_and_payable_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["room_id"], name: "index_photos_on_room_id"

  create_table "professional_profiles", force: :cascade do |t|
    t.text     "about_me"
    t.integer  "professional_user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "professional_profiles", ["professional_user_id"], name: "index_professional_profiles_on_professional_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "label"
    t.text     "question"
    t.integer  "questionable_id"
    t.string   "questionable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "questions", ["questionable_type", "questionable_id"], name: "index_questions_on_questionable_type_and_questionable_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "status"
  end

  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",       default: 1
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "reviews", ["room_id"], name: "index_reviews_on_room_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "home_type"
    t.string   "room_type"
    t.integer  "accommodate"
    t.integer  "bed_room"
    t.integer  "bath_room"
    t.string   "listing_name"
    t.text     "summary"
    t.string   "address"
    t.boolean  "is_tv"
    t.boolean  "is_kitchen"
    t.boolean  "is_air"
    t.boolean  "is_heating"
    t.boolean  "is_internet"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "service_bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_service_id"
    t.datetime "date"
    t.integer  "status"
    t.decimal  "price"
    t.text     "notes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_bookings", ["service_service_id"], name: "index_service_bookings_on_service_service_id"
  add_index "service_bookings", ["user_id"], name: "index_service_bookings_on_user_id"

  create_table "service_categories", force: :cascade do |t|
    t.string   "title",                 default: "",  null: false
    t.text     "description",           default: "",  null: false
    t.decimal  "minimum_rate",          default: 0.0, null: false
    t.decimal  "maximum_rate"
    t.decimal  "commission_percentage", default: 0.0, null: false
    t.string   "slug",                  default: "",  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "service_categories", ["id", "slug"], name: "index_service_categories_on_id_and_slug"

  create_table "service_my_answers", force: :cascade do |t|
    t.integer  "service_booking_id"
    t.integer  "answer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_my_answers", ["answer_id"], name: "index_service_my_answers_on_answer_id"
  add_index "service_my_answers", ["service_booking_id"], name: "index_service_my_answers_on_service_booking_id"

  create_table "service_services", force: :cascade do |t|
    t.integer  "professional_id"
    t.text     "title",               default: "", null: false
    t.text     "description",         default: "", null: false
    t.decimal  "rate",                             null: false
    t.decimal  "discounted_rate"
    t.integer  "status",              default: 0,  null: false
    t.integer  "service_category_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "service_services", ["professional_id"], name: "index_service_services_on_professional_id"
  add_index "service_services", ["service_category_id"], name: "index_service_services_on_service_category_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
    t.boolean  "isFeatured"
    t.integer  "user_level",             default: 0,  null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
