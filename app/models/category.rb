class Category < ApplicationRecord
    has_ancestry
    has_many :categorizations
    has_many :products, through: :categorizations
    has_many :company_categories
    has_many :companies, through: :company_categories
    has_many :posting_source_categories
    has_many :posting_source, through: :posting_source_categories

    mount_uploader :picture, ProductPicturesUploader
    mount_uploader :banner, ProductPicturesUploader


    def self.specialized_industries
        Product.find_by_sql('select * from categories inner join specialized_industries ON specialized_industries.category_id=categories.id order by specialized_industries.position')
    end
end
