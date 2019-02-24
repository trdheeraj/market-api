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

ActiveRecord::Schema.define(version: 2019_02_24_115228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "address_2"
    t.string "district"
    t.string "state"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_transactions", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "date"
    t.string "payment_type"
    t.float "amount"
    t.float "balance_amount"
    t.integer "sales_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_transactions_on_customer_id", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "address_id"
    t.bigint "mobile"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["mobile"], name: "index_customers_on_mobile", unique: true
    t.index ["name"], name: "index_customers_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.float "rate"
    t.string "hsn"
    t.string "gst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "purchase_invoices", force: :cascade do |t|
    t.integer "bill_number"
    t.integer "supplier_id"
    t.datetime "date"
    t.float "discount"
    t.string "payment_type"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_number"], name: "index_purchase_invoices_on_bill_number", unique: true
    t.index ["supplier_id"], name: "index_purchase_invoices_on_supplier_id", unique: true
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer "purchase_invoice_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_invoice_id"], name: "index_purchase_orders_on_purchase_invoice_id"
  end

  create_table "sales_invoices", force: :cascade do |t|
    t.integer "bill_number"
    t.integer "customer_id"
    t.datetime "date"
    t.float "discount"
    t.string "payment_type"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_number"], name: "index_sales_invoices_on_bill_number", unique: true
    t.index ["customer_id"], name: "index_sales_invoices_on_customer_id", unique: true
  end

  create_table "sales_orders", force: :cascade do |t|
    t.integer "sales_invoice_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_invoice_id"], name: "index_sales_orders_on_sales_invoice_id", unique: true
  end

  create_table "supplier_transactions", force: :cascade do |t|
    t.integer "supplier_id"
    t.datetime "date"
    t.string "payment_type"
    t.float "amount"
    t.float "balance_amount"
    t.integer "purchase_invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_supplier_transactions_on_supplier_id", unique: true
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.integer "address_id"
    t.bigint "mobile"
    t.string "email"
    t.string "tin_number"
    t.string "gst_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_suppliers_on_email", unique: true
    t.index ["mobile"], name: "index_suppliers_on_mobile", unique: true
    t.index ["name"], name: "index_suppliers_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
