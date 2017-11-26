class AddMinimumOrderQuantityAndUnitOfMeasureAndFobPriceBaseOnQuantityAndFobQuantityAndFobUnitAndSingleFobPriceRangeAndFobMinimumPriceAndFobMaximumPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :minimum_order_quantity, :integer
    add_column :products, :unit_of_measure, :string
    add_column :products, :fob_price_base_on_quantity, :integer
    add_column :products, :fob_quantity, :integer
    add_column :products, :fob_unit, :string
    add_column :products, :single_fob_price_range, :boolean
    add_column :products, :fob_minimum_price_range, :decimal
    add_column :products, :fob_minimum_price, :decimal
    add_column :products, :fob_maximum_price, :decimal
  end
end
