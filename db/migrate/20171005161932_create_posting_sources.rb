class CreatePostingSources < ActiveRecord::Migration[5.0]
  def change
    create_table :posting_sources do |t|
      t.string :name
      t.text :description
      t.integer :purchase_quantity
      t.string :quantity_type
      t.date :valid_to

      t.timestamps
    end
  end
end
