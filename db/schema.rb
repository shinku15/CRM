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

ActiveRecord::Schema.define(version: 20161010054919) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "email"
    t.text     "address"
    t.text     "contact"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_companies_on_organization_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "feedable_id"
    t.string   "feedable_type"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "company_id"
    t.text     "content"
    t.index ["company_id"], name: "index_feeds_on_company_id"
    t.index ["organization_id"], name: "index_feeds_on_organization_id"
  end

  create_table "mobile_numbers", force: :cascade do |t|
    t.integer  "number"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_mobile_numbers_on_company_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "description"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
    t.index ["company_id"], name: "index_notes_on_company_id"
    t.index ["organization_id"], name: "index_notes_on_organization_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.boolean  "view_task"
    t.boolean  "create_task"
    t.boolean  "update_task"
    t.boolean  "edit_task"
    t.boolean  "destroy_task"
    t.boolean  "view_note"
    t.boolean  "create_note"
    t.boolean  "update_note"
    t.boolean  "edit_note"
    t.boolean  "destroy_note"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_roles_on_organization_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "description"
    t.integer  "company_id"
    t.datetime "completed_on"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "assign_to"
    t.boolean  "is_completed",    default: false
    t.date     "completed_at"
    t.integer  "completed_by"
    t.integer  "organization_id"
    t.index ["company_id"], name: "index_tasks_on_company_id"
    t.index ["organization_id"], name: "index_tasks_on_organization_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
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
    t.integer  "organization_id"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
