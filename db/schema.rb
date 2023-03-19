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

ActiveRecord::Schema.define(version: 2023_03_18_084900) do

  create_table "commentis", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "illust_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["illust_id"], name: "index_commentis_on_illust_id"
    t.index ["user_id"], name: "index_commentis_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "subject_id", null: false
    t.integer "illust_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["illust_id"], name: "index_comments_on_illust_id"
    t.index ["subject_id"], name: "index_comments_on_subject_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "illust_tag_relations", force: :cascade do |t|
    t.integer "illust_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["illust_id"], name: "index_illust_tag_relations_on_illust_id"
    t.index ["tag_id"], name: "index_illust_tag_relations_on_tag_id"
  end

  create_table "illusts", force: :cascade do |t|
    t.text "body"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "subject_tag_relations", force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_subject_tag_relations_on_subject_id"
    t.index ["tag_id"], name: "index_subject_tag_relations_on_tag_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_id"
    t.string "image"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commentis", "illusts"
  add_foreign_key "commentis", "users"
  add_foreign_key "comments", "illusts"
  add_foreign_key "comments", "subjects"
  add_foreign_key "comments", "users"
  add_foreign_key "illust_tag_relations", "illusts"
  add_foreign_key "illust_tag_relations", "tags"
  add_foreign_key "subject_tag_relations", "subjects"
  add_foreign_key "subject_tag_relations", "tags"
end
