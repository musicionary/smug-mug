class RemoveNameColumns < ActiveRecord::Migration
  def change
    remove_column :customers, :name
    remove_column :farmers, :name
    remove_column :roasters, :name
  end
end
