class CreatePostingSourceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :posting_source_categories do |t|
      t.integer :category_id
      t.integer :category_id

      t.timestamps
    end
  end
end
