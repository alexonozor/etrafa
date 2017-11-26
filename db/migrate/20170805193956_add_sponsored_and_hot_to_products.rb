class AddSponsoredAndHotToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sponsored, :boolean, default: false
    add_column :products, :hot, :boolean, default: false
  end
end
