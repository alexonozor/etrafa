class AddPostingSourceIdToPostingSourceCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :posting_source_categories, :posting_source_id, :integer
  end
end
