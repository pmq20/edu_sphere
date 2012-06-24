# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080714045530) do

  create_table "configdatas", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "view_widgets", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.integer  "viewpage_id", :limit => 11
    t.integer  "widget_id",   :limit => 11
    t.integer  "number",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewpages", :force => true do |t|
    t.string   "identification"
    t.integer  "number",         :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width",          :limit => 11
  end

  create_table "widgets", :force => true do |t|
    t.string   "name"
    t.string   "dom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "widgetsettings", :force => true do |t|
    t.integer  "widget_id",  :limit => 11
    t.integer  "user_id",    :limit => 11
    t.string   "name"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
