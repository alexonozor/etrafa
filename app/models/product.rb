class Product < ApplicationRecord
    #valiadate
    validates :user_id, presence: true
    mount_uploaders :pictures, ProductPicturesUploader
    belongs_to :user

    has_many :categorizations
    has_many :categories, through: :categorizations

    def self.sponsored_products
        Product.find_by_sql('select products.*, special_products.position as position from products inner join special_products ON special_products.product_id=products.id order by special_products.position')
    end

    def self.hot_products
        Product.find_by_sql('select * from products inner join hot_products ON hot_products.product_id=products.id order by hot_products.position')
    end
end