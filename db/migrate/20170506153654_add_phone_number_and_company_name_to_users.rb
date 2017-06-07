class AddPhoneNumberAndCompanyNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :company_name, :string
  end
end
