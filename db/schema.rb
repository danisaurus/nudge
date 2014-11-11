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

ActiveRecord::Schema.define(version: 20141111165428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: true do |t|
    t.integer  "daily_report_id"
    t.integer  "quantitative"
    t.date     "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_reports", force: true do |t|
    t.integer  "user_id"
    t.date     "created_at"
    t.datetime "updated_at"
  end

  create_table "gmails", force: true do |t|
    t.float    "quantitative"
    t.string   "qualitative"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "daily_report_id"
  end

  create_table "keywords", force: true do |t|
    t.string   "text"
    t.float    "relevance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gmail_id"
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
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.string   "secret"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triggers", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.text     "message_text"
    t.integer  "duration_in_hours"
    t.datetime "time_last_run",     default: '2014-11-11 22:16:54'
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",            default: true
  end

  create_table "tweets", force: true do |t|
    t.string   "qualitative"
    t.float    "quantitative"
    t.integer  "id_of_tweet",     limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "daily_report_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "gmail"
    t.datetime "last_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_history_number"
  end

end
