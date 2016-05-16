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

ActiveRecord::Schema.define(version: 20160516042639) do

  create_table "contacts", force: :cascade do |t|
    t.string   "contact_id"
    t.string   "contact_username"
    t.string   "coupon_code"
    t.integer  "retweet_count"
    t.string   "retailer_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "retailer_name"
    t.string   "coupon_code"
    t.string   "contact_id"
    t.string   "contact_username"
    t.string   "tweet_text"
    t.integer  "retweet_count"
    t.integer  "favourite_count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "tweet_id"
    t.string   "tweet_text"
    t.string   "contact_id"
    t.string   "contact_username"
    t.string   "referral_link"
    t.string   "retailer_name"
    t.string   "coupon_code"
    t.datetime "tweet_timestamp"
    t.integer  "retweet_count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end