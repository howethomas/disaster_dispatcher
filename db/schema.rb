# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080902025855) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "cell"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "post_code"
    t.string   "time_zone"
    t.string   "account_id"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "custom0"
    t.string   "custom1"
    t.string   "custom2"
    t.string   "custom3"
    t.string   "custom4"
    t.string   "screen_name"
  end

  create_table "histories", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "contact_id"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.boolean  "public_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", :force => true do |t|
    t.string   "version"
    t.boolean  "mock"
    t.integer  "debug_level"
    t.string   "admin_name"
    t.string   "admin_email"
    t.boolean  "daily_summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "admin_phone"
    t.string   "support_url"
    t.string   "bw_user"
    t.string   "bw_pass"
    t.string   "bw_server"
    t.string   "twitter_user"
    t.string   "twitter_pass"
    t.string   "news_feed"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "account_id",                              :default => 0
  end

end
