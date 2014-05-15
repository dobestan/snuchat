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

ActiveRecord::Schema.define(version: 20140515055115) do

  create_table "faqs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposal_relationships", force: true do |t|
    t.integer  "proposal_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposal_relationships", ["answer_id"], name: "index_proposal_relationships_on_answer_id"
  add_index "proposal_relationships", ["proposal_id", "answer_id"], name: "index_proposal_relationships_on_proposal_id_and_answer_id", unique: true
  add_index "proposal_relationships", ["proposal_id"], name: "index_proposal_relationships_on_proposal_id"

  create_table "proposals", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.boolean  "answer",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "mysnu"
    t.string   "password_digest"
    t.boolean  "active",           default: false
    t.string   "activation_token"
    t.string   "remember_token"
    t.boolean  "admin",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
