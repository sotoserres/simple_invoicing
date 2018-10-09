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

ActiveRecord::Schema.define(version: 2018_10_09_134314) do

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "fathername"
    t.string "telephone"
    t.string "cellphone"
    t.datetime "dob"
    t.string "email"
    t.string "city"
    t.string "address"
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cat"
    t.string "afm"
  end

  create_table "invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date"
    t.string "paymenttype"
    t.float "value"
    t.float "vat"
    t.float "payable"
    t.integer "user_id"
    t.integer "category"
    t.string "order"
    t.boolean "paid"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.string "subcategory"
    t.string "name"
    t.string "description"
    t.integer "stock"
    t.string "code"
    t.string "barcode"
    t.float "price"
    t.integer "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machineries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "dob"
    t.string "condition"
    t.string "warranty"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "openids", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "email"
    t.string "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "amount"
    t.datetime "date"
    t.string "user_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tractors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "plates"
    t.datetime "dob"
    t.datetime "lastservice"
    t.datetime "filterhours"
    t.datetime "oilhours"
    t.datetime "twh"
    t.string "observations"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
