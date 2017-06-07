class AddPositionToSpecialProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :special_products, :position, :integer
  end
end
