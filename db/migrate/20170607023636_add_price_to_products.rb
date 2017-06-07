class AddPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal, default: 0
  end
end
