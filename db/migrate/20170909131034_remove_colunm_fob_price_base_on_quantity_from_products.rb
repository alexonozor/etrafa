class RemoveColunmFobPriceBaseOnQuantityFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :fob_price_base_on_quantity
  end
end
