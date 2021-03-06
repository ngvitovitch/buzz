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

ActiveRecord::Schema.define(version: 20140326171810) do

  create_table "episode_data", force: true do |t|
    t.integer "episode_id"
    t.integer "current_position", default: 0
    t.boolean "is_played"
    t.integer "user_id"
  end

  add_index "episode_data", ["user_id"], name: "index_episode_data_on_user_id"

  create_table "episodes", force: true do |t|
    t.string   "title"
    t.string   "audio_url"
    t.string   "link_url"
    t.string   "guid"
    t.text     "description"
    t.datetime "publication_date"
    t.integer  "podcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
  end

  add_index "episodes", ["podcast_id"], name: "index_episodes_on_podcast_id"

  create_table "podcasts", force: true do |t|
    t.string   "title"
    t.string   "image_url"
    t.string   "feed_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "link_url"
  end

  create_table "queued_episodes", force: true do |t|
    t.integer "episode_id"
    t.integer "user_id"
  end

  add_index "queued_episodes", ["user_id"], name: "index_queued_episodes_on_user_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "podcast_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "subscription_type", default: "Normal", null: false
  end

  add_index "subscriptions", ["podcast_id"], name: "index_subscriptions_on_podcast_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "id_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
