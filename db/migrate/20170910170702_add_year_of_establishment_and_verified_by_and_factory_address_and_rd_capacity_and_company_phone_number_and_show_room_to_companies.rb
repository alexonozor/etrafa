class AddYearOfEstablishmentAndVerifiedByAndFactoryAddressAndRdCapacityAndCompanyPhoneNumberAndShowRoomToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :year_of_establishment, :date
    add_column :companies, :verified_by, :integer
    add_column :companies, :factory_address, :text
    add_column :companies, :rd_Capacity, :string
    add_column :companies, :company_phone_number, :string
    add_column :companies, :show_room, :string
  end
end
