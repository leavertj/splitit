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

ActiveRecord::Schema.define(:version => 20110708033954) do

  create_table "billparticipants", :force => true do |t|
    t.decimal  "share"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "bill_id"
    t.boolean  "has_paid"
  end

  create_table "bills", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.decimal  "amount"
    t.date     "duedate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "group_id"
  end

  create_table "groupmembers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "user_id"
  end

  create_table "groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.integer  "is_admin"
  end

end
