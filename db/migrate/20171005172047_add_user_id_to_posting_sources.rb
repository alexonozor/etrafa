class AddUserIdToPostingSources < ActiveRecord::Migration[5.0]
  def change
    add_column :posting_sources, :user_id, :integer
  end
end
