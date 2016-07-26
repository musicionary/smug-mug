class AddColumnsToFarmers < ActiveRecord::Migration
  def change
    add_column :farmers, :country, :string 
  end
end
