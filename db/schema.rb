# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_06_16_163245) do
  create_table "charalists", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chara_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chara_id"], name: "index_charalists_on_chara_id"
    t.index ["user_id"], name: "index_charalists_on_user_id"
  end

  create_table "charas", charset: "utf8mb4", force: :cascade do |t|
    t.string "charaname"
    t.string "backtext"
    t.text "maintext"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chara_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chara_id"], name: "index_likes_on_chara_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "bio"
    t.string "user_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "charalists", "charas"
  add_foreign_key "charalists", "users"
  add_foreign_key "likes", "charas"
  add_foreign_key "likes", "users"
end
