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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111129145543) do

  create_table "bandrelations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bandrelations", ["band_id"], :name => "index_bandrelations_on_band_id"
  add_index "bandrelations", ["user_id", "band_id"], :name => "index_bandrelations_on_user_id_and_band_id", :unique => true
  add_index "bandrelations", ["user_id"], :name => "index_bandrelations_on_user_id"

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.date     "creation_date"
    t.string   "lastFM_bandname"
    t.text     "bio"
    t.string   "twitter_url"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "comment_id"
    t.string   "comment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "name"
    t.date     "borndate"
    t.string   "lastFM_nickname"
    t.datetime "last_signed_in_at"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
