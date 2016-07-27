class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.string :country
      t.string :phone_number
      t.string :elevation
      t.string :city
      t.string :varietal
      t.decimal :crop_cost, precision: 8, scale: 2
      t.decimal :shipping_cost, precision: 8, scale: 2
      t.integer :user_id
    end
  end
end
