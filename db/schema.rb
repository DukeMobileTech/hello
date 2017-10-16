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

ActiveRecord::Schema.define(version: 20171016140358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_admin_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_admin_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_admin_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "pictogram_file_name"
    t.string   "pictogram_content_type"
    t.integer  "pictogram_file_size"
    t.datetime "pictogram_updated_at"
    t.text     "pictogram_data"
    t.integer  "position"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "language"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "doc_file_file_name"
    t.string   "doc_file_content_type"
    t.integer  "doc_file_file_size"
    t.datetime "doc_file_updated_at"
    t.text     "doc_file_data"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tag"
    t.string   "title"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.string   "video_meta"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "subtitle_file_name"
    t.string   "subtitle_content_type"
    t.integer  "subtitle_file_size"
    t.datetime "subtitle_updated_at"
    t.text     "video_data"
    t.text     "subtitle_data"
  end

  create_table "subtitles", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "language"
    t.text     "subtitle_data"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "transcripts", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "language"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string   "title"
    t.string   "language"
    t.integer  "post_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.text     "audio_data"
  end

end
