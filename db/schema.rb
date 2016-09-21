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

ActiveRecord::Schema.define(version: 20161004140814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "mac_id"
    t.text     "saidby"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["mac_id"], name: "index_comments_on_mac_id", using: :btree

  create_table "divisions", force: :cascade do |t|
    t.text     "name"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "macs", force: :cascade do |t|
    t.text     "what"
    t.text     "why"
    t.text     "how"
    t.text     "success"
    t.text     "rollback"
    t.text     "division"
    t.text     "createdby"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "when"
    t.text     "status"
    t.text     "requester"
    t.text     "reason"
    t.text     "successreason"
    t.text     "failreason"
  end

  add_foreign_key "comments", "macs"
end
