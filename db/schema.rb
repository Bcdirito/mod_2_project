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

ActiveRecord::Schema.define(version: 2018_10_22_180931) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "listeners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "user_name"
    t.string "password_digest"
    t.integer "genre_id"
    t.string "band_members"
    t.string "bio"
    t.string "image"
    t.string "song"
    t.float "rate"
    t.text "links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_musicians_on_genre_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "listener_id"
    t.integer "musician_id"
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listener_id"], name: "index_reviews_on_listener_id"
    t.index ["musician_id"], name: "index_reviews_on_musician_id"
  end

end
