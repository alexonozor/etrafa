class AddBusinessTypeToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :business_type, :string
  end
end
