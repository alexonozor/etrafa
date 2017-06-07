class AddTitleAndJobTitleAndCountryAndStateAndCityAndCategoryIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :title, :string
    add_column :users, :job_title, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :category_id, :integer
  end
end
