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

ActiveRecord::Schema.define(version: 20170808163453) do

  create_table "sound_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "leader_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.string   "artist"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.binary   "channel1",   limit: 10485760
    t.binary   "channel2",   limit: 10485760
    t.binary   "channel3",   limit: 10485760
    t.binary   "channel4",   limit: 10485760
    t.binary   "channel5",   limit: 10485760
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.integer  "sound_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
