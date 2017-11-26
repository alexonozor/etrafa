class AddSubmitForReviewToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :submit_for_review, :boolean, default: false
  end
end
