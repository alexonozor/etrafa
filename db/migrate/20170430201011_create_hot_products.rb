class CreateHotProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :hot_products do |t|
      t.integer :product_id
      t.integer :position

      t.timestamps
    end
  end
end
