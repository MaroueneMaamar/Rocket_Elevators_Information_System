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

ActiveRecord::Schema.define(version: 2020_03_10_191041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace", limit: 255
    t.text "body"
    t.string "resource_type", limit: 255
    t.bigint "resource_id"
    t.string "author_type", limit: 255
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "idx_16758_index_active_admin_comments_on_author_type_and_author"
    t.index ["namespace"], name: "idx_16758_index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "idx_16758_index_active_admin_comments_on_resource_type_and_reso"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "firstnname", limit: 255, default: "", null: false
    t.string "name", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "idx_16767_index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_16767_index_admin_users_on_reset_password_token", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.string "firstname", limit: 255, default: "", null: false
    t.string "title", limit: 255, default: "", null: false
    t.string "email", limit: 255, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factquotes", force: :cascade do |t|
    t.integer "quoteid", default: 0, null: false
    t.datetime "creation"
    t.string "companyname", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "nbelevator", default: 0, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_16800_index_posts_on_user_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "numappartment", default: 0, null: false
    t.integer "numfloors", default: 0, null: false
    t.integer "numbasement", default: 0, null: false
    t.integer "numparking", default: 0, null: false
    t.integer "numbusiness", default: 0, null: false
    t.integer "numelevatorsdesired", default: 0, null: false
    t.integer "numoccupantsperfloor", default: 0, null: false
    t.integer "numelevatorestimated"
    t.float "installfee"
    t.float "subtotal"
    t.float "totalprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jobquality"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "superadmin", default: false, null: false
    t.string "username", limit: 255
    t.string "company", limit: 255
    t.index ["company"], name: "idx_16825_index_users_on_company", unique: true
    t.index ["email"], name: "idx_16825_index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_16825_index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "idx_16825_index_users_on_username", unique: true
  end

  add_foreign_key "posts", "users"
end
