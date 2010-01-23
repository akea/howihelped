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

ActiveRecord::Schema.define(:version => 20091011222346) do

  create_table "answers", :force => true do |t|
    t.text     "body"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_name"
    t.string   "country_code"
    t.string   "country_code3"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.decimal  "latitude",      :precision => 15, :scale => 10
    t.decimal  "longitude",     :precision => 15, :scale => 10
    t.boolean  "approved"
    t.string   "akismet"
    t.string   "user_agent"
    t.string   "user_ip"
    t.string   "referrer"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "benefit"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_name"
    t.string   "country_code"
    t.string   "country_code3"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.decimal  "latitude",      :precision => 15, :scale => 10
    t.decimal  "longitude",     :precision => 15, :scale => 10
    t.boolean  "approved"
    t.string   "akismet"
    t.string   "user_agent"
    t.string   "user_ip"
    t.string   "referrer"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "level",         :default => 100
    t.string   "invite"
    t.string   "user_agent"
    t.string   "user_ip"
    t.string   "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "fk_voteables"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "uniq_one_vote_only", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "fk_voters"

end
