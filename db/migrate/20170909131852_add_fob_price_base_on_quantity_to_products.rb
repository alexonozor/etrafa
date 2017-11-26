class AddFobPriceBaseOnQuantityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :fob_price_base_on_quantity, :boolean
  end
end
