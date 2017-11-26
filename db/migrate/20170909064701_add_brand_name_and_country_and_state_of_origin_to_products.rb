class AddBrandNameAndCountryAndStateOfOriginToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :brand_name, :string
    add_column :products, :country, :string
    add_column :products, :state_of_origin, :string
  end
end
