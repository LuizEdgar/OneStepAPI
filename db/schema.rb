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

ActiveRecord::Schema.define(version: 20170508204706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "causes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "causes_opportunities", id: false, force: :cascade do |t|
    t.integer "cause_id",       null: false
    t.integer "opportunity_id", null: false
  end

  create_table "causes_organizations", id: false, force: :cascade do |t|
    t.integer "cause_id",        null: false
    t.integer "organization_id", null: false
  end

  create_table "causes_volunteers", id: false, force: :cascade do |t|
    t.integer "cause_id",     null: false
    t.integer "volunteer_id", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postcode"
    t.decimal  "latitude",         precision: 15, scale: 10
    t.decimal  "longitude",        precision: 15, scale: 10
    t.string   "localizable_type"
    t.integer  "localizable_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["localizable_type", "localizable_id"], name: "index_locations_on_localizable_type_and_localizable_id", using: :btree
  end

  create_table "opportunities_skills", id: false, force: :cascade do |t|
    t.integer "opportunity_id", null: false
    t.integer "skill_id",       null: false
  end

  create_table "oppotunities", force: :cascade do |t|
    t.string   "title"
    t.integer  "volunteers_number"
    t.text     "description"
    t.string   "time_commitment"
    t.string   "requirements"
    t.string   "opportunitable_type"
    t.integer  "opportunitable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["opportunitable_type", "opportunitable_id"], name: "index_oppotunities_on_opportunitable_type_and_opportunitable_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "cnpj"
    t.string   "site"
    t.text     "about"
    t.text     "mission"
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
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "facebook_id"
    t.string   "auth",            null: false
    t.string   "password_digest", null: false
    t.integer  "kind",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name",                                null: false
    t.date     "birth_at"
    t.text     "about"
    t.string   "occupation"
    t.integer  "gender",              default: 0
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

  add_foreign_key "organizations", "users"
  add_foreign_key "volunteers", "users"
end
