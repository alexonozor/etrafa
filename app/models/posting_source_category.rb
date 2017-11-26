class PostingSourceCategory < ApplicationRecord
    belongs_to :category
    belongs_to :posting_source
end
