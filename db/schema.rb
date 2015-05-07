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

ActiveRecord::Schema.define(version: 20150507183805) do

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

  create_table "characters", force: :cascade do |t|
    t.string  "character_name"
    t.string  "character_class"
    t.integer "level"
    t.string  "background"
    t.string  "player_name"
    t.string  "race"
    t.string  "alignment"
    t.integer "xp"
    t.string  "subrace"
    t.string  "type"
  end

  create_table "skills", force: :cascade do |t|
    t.boolean "acro"
    t.boolean "animal"
    t.boolean "arcana"
    t.boolean "athletics"
    t.boolean "decept"
    t.boolean "hist"
    t.boolean "insight"
    t.boolean "intimidation"
    t.boolean "invest"
    t.boolean "med"
    t.boolean "nature"
    t.boolean "percept"
    t.boolean "perform"
    t.boolean "persuasion"
    t.boolean "religion"
    t.boolean "sleight"
    t.boolean "stealth"
    t.boolean "survival"
  end

end
