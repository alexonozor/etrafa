class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :place_of_origin
      t.string :size
      t.text :packings
      t.text :description
      t.text :features

      t.timestamps
    end
  end
end
