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

ActiveRecord::Schema.define(version: 20160819125042) do

  create_table "class_journals", force: :cascade do |t|
    t.integer  "form_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "class_journals", ["form_id"], name: "index_class_journals_on_form_id"
  add_index "class_journals", ["subject_id"], name: "index_class_journals_on_subject_id"

  create_table "forms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "class_journal_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "homework"
  end

  add_index "lessons", ["class_journal_id"], name: "index_lessons_on_class_journal_id"

  create_table "marks", force: :cascade do |t|
    t.string   "mark"
    t.integer  "lesson_id"
    t.integer  "pupil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "marks", ["lesson_id"], name: "index_marks_on_lesson_id"
  add_index "marks", ["pupil_id"], name: "index_marks_on_pupil_id"

  create_table "pupils", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "pupils", ["form_id"], name: "index_pupils_on_form_id"
  add_index "pupils", ["user_id"], name: "index_pupils_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
