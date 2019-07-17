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

ActiveRecord::Schema.define(version: 2019_07_17_045824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "add_buyer_reference_to_vinyls", force: :cascade do |t|
    t.bigint "vinyl_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vinyl_id"], name: "index_add_buyer_reference_to_vinyls_on_vinyl_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vinyl_id"
    t.index ["profile_id"], name: "index_buyers_on_profile_id"
    t.index ["vinyl_id"], name: "index_buyers_on_vinyl_id"
  end

  create_table "buyers_sellers", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_buyers_sellers_on_buyer_id"
    t.index ["seller_id"], name: "index_buyers_sellers_on_seller_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "user_name"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_sellers_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vinyls", force: :cascade do |t|
    t.string "artist"
    t.string "genre"
    t.string "name"
    t.date "year"
    t.float "price"
    t.text "description"
    t.bigint "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "buyer_id"
    t.index ["buyer_id"], name: "index_vinyls_on_buyer_id"
    t.index ["seller_id"], name: "index_vinyls_on_seller_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "add_buyer_reference_to_vinyls", "vinyls"
  add_foreign_key "buyers", "profiles"
  add_foreign_key "buyers", "vinyls"
  add_foreign_key "buyers_sellers", "buyers"
  add_foreign_key "buyers_sellers", "sellers"
  add_foreign_key "profiles", "users"
  add_foreign_key "sellers", "profiles"
  add_foreign_key "vinyls", "buyers"
  add_foreign_key "vinyls", "sellers"
end
