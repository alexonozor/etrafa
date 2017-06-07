class CreateSpecializedIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :specialized_industries do |t|
      t.integer :category_id
      t.integer :position

      t.timestamps
    end
  end
end
