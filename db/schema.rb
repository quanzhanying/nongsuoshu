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


ActiveRecord::Schema.define(version: 20160914030615) do


  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "aasm_state",        default: "book_created"
    t.integer  "category_id"
    t.text     "introduction"
    t.string   "author_name"
    t.date     "published_date"
    t.float    "rating_from_ma"
    t.float    "rating_from_users"
    t.integer  "pv"
    t.string   "comments_count"
    t.string   "amazon_link"
    t.string   "translater_name"
    t.boolean  "is_free",           default: false
    t.boolean  "is_editor_choice",  default: false
    t.string   "token"
    t.string   "cover_image_link"
    t.index ["aasm_state"], name: "index_books_on_aasm_state"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "chs_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "favorites_relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false

  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price"
    t.integer  "plan_id"
    t.boolean  "is_paid"
    t.string   "payment_method"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "token"
    t.string   "aasm_state"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "plan_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "user_name"
    t.datetime "expired_at"
    t.boolean  "is_paid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
