class AddColumnToFarmers < ActiveRecord::Migration
  def change
    add_column :farmers, :phone_number, :string
    add_column :farmers, :elevation, :string
    add_column :farmers, :city, :string
    add_column :farmers, :varietal, :string
    add_column :farmers, :crop_cost, :decimal, precision: 8, scale: 2
    add_column :farmers, :shipping_cost, :decimal, precision: 8, scale: 2
  end
end
