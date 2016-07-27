class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.decimal :weight, precision: 8, scale: 2
      t.integer :roaster_id
      t.integer :user_id
    end
  end
end
