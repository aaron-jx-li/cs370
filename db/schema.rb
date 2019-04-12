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

ActiveRecord::Schema.define(version: 2019_03_13_061624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer "course_num"
    t.string "name"
    t.string "semester"
    t.json "meta_values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "tutor_id"
    t.bigint "request_id"
    t.json "meta_values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_meetings_on_request_id"
    t.index ["tutor_id"], name: "index_meetings_on_tutor_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "tutee_id"
    t.bigint "course_id"
    t.string "subject"
    t.json "meta_values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_requests_on_course_id"
    t.index ["tutee_id"], name: "index_requests_on_tutee_id"
  end

  create_table "tutees", force: :cascade do |t|
    t.bigint "sid"
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "email"
    t.string "privilege"
    t.string "gender"
    t.string "pronoun"
    t.string "ethnicity"
    t.string "major"
    t.boolean "dsp"
    t.boolean "transfer"
    t.string "year"
    t.json "meta_values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meetings", "requests"
  add_foreign_key "meetings", "tutors"
  add_foreign_key "requests", "courses"
  add_foreign_key "requests", "tutees"
end
