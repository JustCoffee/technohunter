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

ActiveRecord::Schema.define(version: 20150822203205) do

  create_table "bids", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "patr"
    t.string   "email"
    t.string   "tel"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_id"
    t.string   "aut_type"
    t.integer  "status"
  end

  create_table "brand_equips", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brand_trucks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.string   "city"
    t.string   "auto_type"
    t.string   "model"
    t.integer  "year"
    t.string   "sost"
    t.text     "desc"
    t.integer  "price"
    t.string   "engine"
    t.string   "cuzov"
    t.string   "probeg"
    t.string   "kpp"
    t.string   "engv"
    t.string   "privod"
    t.integer  "user_id"
    t.string   "brand"
    t.string   "photo"
    t.boolean  "moder",              default: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",             default: "",    null: false
    t.integer  "offer_status",       default: 1,     null: false
    t.text     "comment"
    t.string   "region",                             null: false
    t.string   "vin_code",           default: "",    null: false
  end

  create_table "cities", primary_key: "city_id", force: true do |t|
    t.integer "country_id",             default: 0,  null: false
    t.integer "region_id",              default: 0,  null: false
    t.string  "name",       limit: 128, default: "", null: false
  end

  add_index "cities", ["country_id"], name: "country_id", using: :btree
  add_index "cities", ["region_id"], name: "region_id", using: :btree

  create_table "countries", primary_key: "country_id", force: true do |t|
    t.integer "city_id",             default: 0,  null: false
    t.string  "name",    limit: 128, default: "", null: false
  end

  add_index "countries", ["city_id"], name: "city_id", using: :btree

  create_table "equips", force: true do |t|
    t.string   "city"
    t.string   "equip_type"
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.integer  "hofuse"
    t.string   "status"
    t.text     "desc"
    t.integer  "price"
    t.boolean  "moder",              default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "offer_status",       default: 1,     null: false
    t.text     "comment"
    t.string   "region",                             null: false
    t.string   "vin_code",           default: "",    null: false
  end

  create_table "mark_equips", force: true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mark_trucks", force: true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marks", force: true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marks", ["brand_id"], name: "index_marks_on_brand_id", using: :btree

  create_table "offers", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "city"
    t.string   "tel"
    t.integer  "user_id"
    t.boolean  "moder",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "car_id"
    t.string   "image"
    t.integer  "truck_id"
    t.integer  "equip_id"
  end

  create_table "regions", primary_key: "region_id", force: true do |t|
    t.integer "country_id",            default: 0,  null: false
    t.integer "city_id",               default: 0,  null: false
    t.string  "name",       limit: 64, default: "", null: false
  end

  add_index "regions", ["city_id"], name: "city_id", using: :btree
  add_index "regions", ["country_id"], name: "country_id", using: :btree

  create_table "trucks", force: true do |t|
    t.string   "city"
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.integer  "mileage"
    t.string   "engine"
    t.string   "engv"
    t.integer  "hofuse"
    t.string   "status"
    t.text     "desc"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "moder",              default: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.string   "type_avto"
    t.integer  "offer_status",       default: 1,     null: false
    t.text     "comment"
    t.string   "region",                             null: false
    t.string   "vin_code",           default: "",    null: false
  end

  create_table "users", force: true do |t|
    t.boolean  "admin"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_role",              default: 0
    t.string   "site"
    t.string   "comp_name"
    t.string   "law_name"
    t.string   "law_address"
    t.string   "post_address"
    t.string   "inn"
    t.string   "fio_ruk"
    t.string   "fio_buch"
    t.string   "fio_main_person"
    t.string   "gor_tel_main"
    t.string   "mob_tel_main"
    t.string   "fio_dop_person"
    t.string   "email_dop"
    t.string   "gor_tel_dop"
    t.string   "mob_tel_dop"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
