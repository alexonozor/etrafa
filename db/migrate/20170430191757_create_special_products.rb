class CreateSpecialProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :special_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end
end
