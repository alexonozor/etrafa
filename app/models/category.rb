class Category < ApplicationRecord
    has_ancestry
    has_many :categorizations
    has_many :products, through: :categorizations

    def self.specialized_industries
        Product.find_by_sql('select * from categories inner join specialized_industries ON specialized_industries.category_id=categories.id order by specialized_industries.position')
    end
end
