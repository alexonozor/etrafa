class AddConsignmentWeightAndWeightUnitAndOrderLeadingStartTimeAndOrderLeandingEndTimeAndPaymentMethodIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :consignment_weight, :integer
    add_column :products, :weight_unit, :integer
    add_column :products, :order_leading_start_time, :date
    add_column :products, :order_leading_end_time, :date
    add_column :products, :payment_method_id, :integer
  end
end
