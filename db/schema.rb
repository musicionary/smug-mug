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

ActiveRecord::Schema.define(version: 20160725230435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crops", force: :cascade do |t|
    t.integer  "farmer_id"
    t.integer  "roaster_id"
    t.string   "country_of_origin"
    t.string   "elevation"
    t.string   "varietal"
    t.date     "harvest_date"
    t.decimal  "price",             precision: 8, scale: 2
    t.integer  "ounces"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["farmer_id"], name: "index_crops_on_farmer_id", using: :btree
    t.index ["roaster_id"], name: "index_crops_on_roaster_id", using: :btree
  end

  create_table "farmers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.integer  "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roasters", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password"
    t.integer  "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roasts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.integer  "ounces"
    t.integer  "roaster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crop_id"
    t.index ["roaster_id"], name: "index_roasts_on_roaster_id", using: :btree
  end

end
