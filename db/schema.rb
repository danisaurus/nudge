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

ActiveRecord::Schema.define(version: 20141109033219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gmail_accounts", force: true do |t|
    t.string  "last_history_number"
    t.integer "user_id"
  end

  create_table "supporters", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "gmail"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supporters", ["user_id"], name: "index_supporters_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "method"
    t.integer  "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: true do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triggers", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.text     "message_text"
    t.integer  "duration_in_hours"
    t.datetime "time_last_run",     default: '2014-11-10 15:02:24'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "gmail"
    t.string   "twitter"
    t.string   "refresh_token"
    t.datetime "last_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_history_number"
  end

end
