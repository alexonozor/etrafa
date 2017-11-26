class Product < ApplicationRecord
    #valiadate
    validates :user_id, 
              :title, 
              :description, 
              :features,
              :price,
              :model_number,
              :primary_picture,
              :category_ids,
              :key_word,  presence: true

    mount_uploaders :pictures, ProductPicturesUploader
    mount_uploader :primary_picture, PrimaryPictureUploader
    belongs_to :user

    has_many :categorizations
    has_many :categories, through: :categorizations
    belongs_to :special_product

    default_scope { order(created_at: 'DESC') }

    def self.submitted_products(user)
        self.where('submit_for_review = ? AND user_id = ?', true, user.id)
    end

    
    def self.hot_products
        self.where('hot' => true)    
    end

    def self.sponsored_products
        self.where('sponsored' => true)
    end

    def self.saved_products(user)
        self.where('submit_for_review = ? AND user_id = ?', false, user.id)
    end

    # t.string   "title"
    # t.string   "place_of_origin"
    # t.string   "size"
    # t.text     "packings"
    # t.text     "description"
    # t.text     "features"
    # t.datetime "created_at",                                 null: false
    # t.datetime "updated_at",                                 null: false
    # t.json     "pictures"
    # t.integer  "user_id"
    # t.decimal  "price",                      default: "0.0"
    # t.boolean  "sponsored",                  default: false
    # t.boolean  "hot",                        default: false
    # t.string   "model_number"
    # t.string   "primary_picture"
    # t.string   "key_word"
    # t.integer  "minimum_order_quantity"
    # t.string   "unit_of_measure"
    # t.integer  "fob_price_base_on_quantity"
    # t.integer  "fob_quantity"
    # t.string   "fob_unit"
    # t.boolean  "single_fob_price_range"
    # t.decimal  "fob_minimum_price_range"
    # t.decimal  "fob_minimum_price"
    # t.decimal  "fob_maximum_price"
    # t.integer  "consignment_weight"
    # t.integer  "weight_unit"
    # t.date     "order_leading_start_time"
    # t.date     "order_leading_end_time"
    # t.integer  "payment_method_id"
    # t.boolean  "sample_availability"
    # t.string   "sample_policy"
    # t.decimal  "sample_cost"
    # t.boolean  "choose_not_disclose"
    # t.string   "brand_name"
    # t.string   "country"
    # t.string   "state_of_origin"
end