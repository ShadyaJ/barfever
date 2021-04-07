# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2021_04_07_093712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_musics", force: :cascade do |t|
    t.bigint "music_id", null: false
    t.bigint "bar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bar_id"], name: "index_bar_musics_on_bar_id"
    t.index ["music_id"], name: "index_bar_musics_on_music_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.string "price"
    t.string "address_street"
    t.string "address_zipcode"
    t.string "address_city"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "photo_url_1"
    t.string "photo_url_2"
    t.string "music_style"
    t.boolean "terrace"
    t.index ["user_id"], name: "index_bars_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "bar_id", null: false
    t.bigint "user_id", null: false
    t.date "date"
    t.boolean "table_booking?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bar_id"], name: "index_bookings_on_bar_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.string "name"
    t.date "date"
    t.bigint "bar_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_url_1"
    t.integer "price"
    t.index ["bar_id"], name: "index_events_on_bar_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_friends_on_booking_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bar_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "review_experience"
    t.integer "review_drink"
    t.integer "review_music"
    t.index ["bar_id"], name: "index_reviews_on_bar_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "status"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bar_musics", "bars"
  add_foreign_key "bar_musics", "musics"
  add_foreign_key "bars", "users"
  add_foreign_key "bookings", "bars"
  add_foreign_key "bookings", "users"
  add_foreign_key "friends", "bookings"
end
