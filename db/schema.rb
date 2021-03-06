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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130611201300) do

  create_table "asset_tags", :force => true do |t|
    t.string   "code"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "device_id"
  end

  add_index "asset_tags", ["code"], :name => "index_asset_tags_on_code", :unique => true

  create_table "categories", :force => true do |t|
    t.text "name"
  end

  create_table "devices", :force => true do |t|
    t.text     "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "status_id"
    t.text     "reference_url"
    t.text     "asset_code"
    t.text     "model"
    t.integer  "category_id"
    t.date     "pat_date"
    t.integer  "training_category_id"
    t.integer  "provenance_id"
    t.date     "date_acquired"
    t.float    "value_when_acquired"
    t.boolean  "minor_item"
  end

  create_table "devices_maintainers", :force => true do |t|
    t.integer "device_id"
    t.integer "user_id"
  end

  create_table "devices_owners", :force => true do |t|
    t.integer "device_id"
    t.integer "owner_id"
  end

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "provenances", :force => true do |t|
    t.text "name"
  end

  create_table "roles", :force => true do |t|
    t.text "name"
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "statuses", :force => true do |t|
    t.text    "name"
    t.integer "severity", :default => 0, :null => false
  end

  create_table "ticket_statuses", :force => true do |t|
    t.text "name"
  end

  create_table "tickets", :force => true do |t|
    t.text     "summary"
    t.text     "details"
    t.integer  "device_id"
    t.integer  "user_id"
    t.integer  "ticket_status_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "training_categories", :force => true do |t|
    t.text "name"
    t.text "rgb"
  end

  create_table "users", :force => true do |t|
    t.text     "name",                                     :null => false
    t.text     "email",                                    :null => false
    t.boolean  "active",                 :default => true, :null => false
    t.text     "password_digest",        :default => "",   :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
