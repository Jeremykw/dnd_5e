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

ActiveRecord::Schema.define(version: 20150705150253) do

  create_table "abilities", force: :cascade do |t|
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "char"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.text     "personality"
    t.text     "ideal"
    t.text     "bond"
    t.text     "flaw"
    t.text     "back_story"
    t.string   "type"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "belongings", force: :cascade do |t|
    t.integer  "item"
    t.integer  "character_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.string   "description"
    t.string   "pack"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string  "character_name"
    t.string  "character_class"
    t.integer "level"
    t.string  "past"
    t.string  "player_name"
    t.string  "race_subrace"
    t.string  "race"
    t.string  "subrace"
    t.string  "alignment"
    t.integer "xp"
    t.boolean "starting_items"
    t.string  "type"
    t.integer "user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "weight"
    t.string   "details"
    t.string   "category"
    t.integer  "ac"
    t.boolean  "dex_mod"
    t.boolean  "dex_mod_max"
    t.integer  "strength"
    t.integer  "stealth"
    t.integer  "speed"
    t.string   "damage"
    t.string   "properties"
    t.boolean  "ranged"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
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

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
