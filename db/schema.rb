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

ActiveRecord::Schema.define(version: 20161016202202) do

  create_table "inventories", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.integer  "twin"
    t.integer  "twinXL"
    t.integer  "full"
    t.integer  "queen"
    t.integer  "king"
    t.integer  "calking"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "twin",       default: 0
    t.integer  "twinXL",     default: 0
    t.integer  "full",       default: 0
    t.integer  "queen",      default: 0
    t.integer  "king",       default: 0
    t.integer  "calking",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "size"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "current_status_id"
    t.string   "current_status_type"
  end

  add_index "products", ["current_status_type", "current_status_id"], name: "index_products_on_current_status_type_and_current_status_id"

  create_table "shipments", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
