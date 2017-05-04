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

ActiveRecord::Schema.define(version: 20170426210027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "causes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "causes_organizations", id: false, force: :cascade do |t|
    t.integer "cause_id",        null: false
    t.integer "organization_id", null: false
  end

  create_table "causes_volunteers", id: false, force: :cascade do |t|
    t.integer "cause_id",     null: false
    t.integer "volunteer_id", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postcode"
    t.decimal  "latitude",   precision: 15, scale: 10
    t.decimal  "longitude",  precision: 15, scale: 10
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "site"
    t.string   "about"
    t.string   "requirements"
    t.string   "goal"
    t.string   "need"
    t.integer  "size"
    t.boolean  "verified",       default: false
    t.date     "established_at"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["user_id"], name: "index_organizations_on_user_id", using: :btree
  end

  create_table "organizations_skills", id: false, force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "skill_id",        null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number",                 null: false
    t.integer  "kind",       default: 0
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_phones_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills_volunteers", id: false, force: :cascade do |t|
    t.integer "skill_id",     null: false
    t.integer "volunteer_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "facebook_id"
    t.integer  "kind",            null: false
    t.string   "auth",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.date     "birth_at"
    t.string   "about"
    t.string   "occupation"
    t.integer  "gender",              default: 0
    t.integer  "day_availability"
    t.integer  "period_availability"
    t.boolean  "volunteered"
    t.string   "cpf"
    t.string   "rg"
    t.boolean  "verified",            default: false
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_volunteers_on_user_id", using: :btree
  end

  add_foreign_key "locations", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "volunteers", "users"
end
