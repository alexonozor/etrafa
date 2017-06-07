class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :profile
      t.string :number_of_employees
      t.string :logo
      t.string :banner
      t.string :trademark
      t.string :website
      t.integer :user_id

      t.timestamps
    end
  end
end
