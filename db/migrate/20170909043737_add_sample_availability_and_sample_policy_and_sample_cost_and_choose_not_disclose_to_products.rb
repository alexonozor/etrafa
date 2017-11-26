class AddSampleAvailabilityAndSamplePolicyAndSampleCostAndChooseNotDiscloseToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sample_availability, :boolean
    add_column :products, :sample_policy, :string
    add_column :products, :sample_cost, :decimal
    add_column :products, :choose_not_disclose, :boolean
  end
end
