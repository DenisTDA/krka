# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_02_181526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.integer "building"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.integer "capacity"
    t.string "units"
    t.string "vareity"
    t.string "extras"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "persons", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "sername"
    t.bigint "pharmacy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pharmacy_id"], name: "index_persons_on_pharmacy_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.integer "number"
    t.bigint "adress_id"
    t.string "inn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_pharmacies_on_adress_id", unique: true
  end

  add_foreign_key "persons", "pharmacies"
  add_foreign_key "pharmacies", "adresses"
end
