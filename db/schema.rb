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

ActiveRecord::Schema.define(version: 2018_10_22_181019) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_musicians", id: false, force: :cascade do |t|
    t.integer "musician_id", null: false
    t.integer "genre_id", null: false
    t.index ["musician_id", "genre_id"], name: "index_genres_musicians_on_musician_id_and_genre_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "band_members"
    t.string "bio"
    t.string "image"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "musician_id"
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_reviews_on_musician_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
