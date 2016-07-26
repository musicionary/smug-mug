class AddUserIdToAccounts < ActiveRecord::Migration
  def change
    add_column(:customers, :user_id, :integer)
    add_column(:farmers, :user_id, :integer)
    add_column(:roasters, :user_id, :integer)
  end
end
