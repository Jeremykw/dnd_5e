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

ActiveRecord::Schema.define(version: 2015_05_30_160333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", id: :serial, force: :cascade do |t|
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "char"
    t.integer "character_id"
    t.datetime "created_at"
  end

  create_table "backgrounds", id: :serial, force: :cascade do |t|
    t.text "personality"
    t.text "ideal"
    t.text "bond"
    t.text "flaw"
    t.text "back_story"
    t.string "type"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", id: :serial, force: :cascade do |t|
    t.string "character_name"
    t.string "character_class"
    t.integer "level"
    t.string "past"
    t.string "player_name"
    t.string "race_subrace"
    t.string "race"
    t.string "subrace"
    t.string "alignment"
    t.integer "xp"
    t.string "type"
    t.integer "user_id"
    t.datetime "created_at"
  end

  create_table "skills", id: :serial, force: :cascade do |t|
    t.boolean "acrobatics"
    t.boolean "animal_handling"
    t.boolean "arcana"
    t.boolean "athletics"
    t.boolean "deception"
    t.boolean "history"
    t.boolean "insight"
    t.boolean "intimidation"
    t.boolean "investigation"
    t.boolean "medicine"
    t.boolean "nature"
    t.boolean "perception"
    t.boolean "performance"
    t.boolean "persuasion"
    t.boolean "religion"
    t.boolean "sleight_of_hand"
    t.boolean "stealth"
    t.boolean "survival"
    t.integer "character_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
