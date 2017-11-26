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

ActiveRecord::Schema.define(version: 20171005173945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.string   "banner"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ancestry"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "profile"
    t.string   "number_of_employees"
    t.string   "logo"
    t.string   "banner"
    t.string   "trademark"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "business_type"
    t.date     "year_of_establishment"
    t.integer  "verified_by"
    t.text     "factory_address"
    t.string   "rd_Capacity"
    t.string   "company_phone_number"
    t.string   "show_room"
  end

  create_table "company_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "company_type_categories", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "company_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "company_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hot_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posting_source_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "posting_source_id"
  end

  create_table "posting_sources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "purchase_quantity"
    t.string   "quantity_type"
    t.date     "valid_to"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "place_of_origin"
    t.string   "size"
    t.text     "packings"
    t.text     "description"
    t.text     "features"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.json     "pictures"
    t.integer  "user_id"
    t.decimal  "price",                      default: "0.0"
    t.boolean  "sponsored",                  default: false
    t.boolean  "hot",                        default: false
    t.string   "model_number"
    t.string   "primary_picture"
    t.string   "key_word"
    t.integer  "minimum_order_quantity"
    t.string   "unit_of_measure"
    t.integer  "fob_quantity"
    t.string   "fob_unit"
    t.boolean  "single_fob_price_range"
    t.decimal  "fob_minimum_price_range"
    t.decimal  "fob_minimum_price"
    t.decimal  "fob_maximum_price"
    t.integer  "consignment_weight"
    t.integer  "weight_unit"
    t.date     "order_leading_start_time"
    t.date     "order_leading_end_time"
    t.integer  "payment_method_id"
    t.boolean  "sample_availability"
    t.string   "sample_policy"
    t.decimal  "sample_cost"
    t.boolean  "choose_not_disclose"
    t.string   "brand_name"
    t.string   "country"
    t.string   "state_of_origin"
    t.boolean  "submit_for_review",          default: false
    t.boolean  "fob_price_base_on_quantity"
  end

  create_table "special_products", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "specialized_industries", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "account_type"
    t.string   "phone_number"
    t.string   "company_name"
    t.string   "title"
    t.string   "job_title"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.integer  "category_id"
    t.string   "member_id"
    t.string   "avatar"
    t.string   "street"
  end

end
