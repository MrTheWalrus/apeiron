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

ActiveRecord::Schema.define(version: 20161212150749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.text     "action"
    t.text     "resolution"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factions", force: true do |t|
    t.text     "name"
    t.string   "fleet"
    t.string   "territory"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", force: true do |t|
    t.string   "number"
    t.text     "name"
    t.text     "brief"
    t.text     "resolution"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.text     "name"
    t.text     "proposer"
    t.text     "description"
    t.text     "resources"
    t.datetime "approved_at"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.decimal  "quantity"
    t.text     "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
