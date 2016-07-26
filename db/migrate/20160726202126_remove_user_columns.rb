class RemoveUserColumns < ActiveRecord::Migration
  def change
    remove_column :customers, :email
    remove_column :customers, :password
    remove_column :customers, :user_type
    remove_column :farmers, :email
    remove_column :farmers, :password
    remove_column :farmers, :user_type
    remove_column :roasters, :email
    remove_column :roasters, :password
    remove_column :roasters, :user_type
  end
end
