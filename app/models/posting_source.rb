class PostingSource < ApplicationRecord
    has_many :posting_source_categories
    has_many :categories, through: :posting_source_categories
    belongs_to :user
end
