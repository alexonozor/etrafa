class AddMemberIdAndAvatarAndStreetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :member_id, :string
    add_column :users, :avatar, :string
    add_column :users, :street, :string
  end
end
