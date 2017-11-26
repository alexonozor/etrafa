class AddModelNumberAndPrimaryPictureAndKeyWordAndToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :model_number, :string
    add_column :products, :primary_picture, :string
    add_column :products, :key_word, :string
  end
end
