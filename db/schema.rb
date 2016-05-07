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

ActiveRecord::Schema.define(version: 20160507095204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrateurs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enseignants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "epreuves", force: :cascade do |t|
    t.date     "date"
    t.string   "titre"
    t.integer  "matiere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "epreuves", ["matiere_id"], name: "index_epreuves_on_matiere_id", using: :btree

  create_table "etudiants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matieres", force: :cascade do |t|
    t.string   "titre"
    t.date     "debut"
    t.date     "fin"
    t.integer  "enseignant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "matieres", ["enseignant_id"], name: "index_matieres_on_enseignant_id", using: :btree
  add_index "matieres", ["user_id"], name: "index_matieres_on_user_id", using: :btree

  create_table "matières", force: :cascade do |t|
    t.string   "titre"
    t.date     "debut"
    t.date     "fin"
    t.integer  "enseignant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "notes", force: :cascade do |t|
    t.float    "note"
    t.integer  "user_id",    null: false
    t.integer  "matiere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "epreuve_id"
  end

  add_index "notes", ["epreuve_id"], name: "index_notes_on_epreuve_id", using: :btree
  add_index "notes", ["matiere_id"], name: "index_notes_on_matiere_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "type"
    t.string   "nom"
    t.string   "prenom"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "epreuves", "matieres"
  add_foreign_key "matieres", "enseignants"
  add_foreign_key "matieres", "users"
  add_foreign_key "notes", "epreuves"
  add_foreign_key "notes", "matieres"
  add_foreign_key "notes", "users"
end
