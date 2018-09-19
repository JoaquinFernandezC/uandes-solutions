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

ActiveRecord::Schema.define(version: 2018_09_19_173000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "document_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_authors_on_document_id"
    t.index ["person_id"], name: "index_authors_on_person_id"
  end

  create_table "commentaries", force: :cascade do |t|
    t.text "message"
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_commentaries_on_task_id"
    t.index ["user_id"], name: "index_commentaries_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.integer "version"
    t.string "classification"
    t.string "type"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "error_logs", force: :cascade do |t|
    t.string "code"
    t.string "privacy"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internal_authors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_internal_authors_on_document_id"
    t.index ["user_id"], name: "index_internal_authors_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "code"
    t.string "privacy"
    t.string "action"
    t.boolean "commentary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "start_date"
    t.datetime "estimated_end_date"
    t.datetime "end_date"
    t.integer "privacy"
    t.integer "priority"
    t.string "state"
    t.boolean "needs_checking"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "rut"
    t.string "position"
    t.string "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors", "documents"
  add_foreign_key "authors", "people"
  add_foreign_key "commentaries", "tasks"
  add_foreign_key "commentaries", "users"
  add_foreign_key "internal_authors", "documents"
  add_foreign_key "internal_authors", "users"
  add_foreign_key "tasks", "users"
end
