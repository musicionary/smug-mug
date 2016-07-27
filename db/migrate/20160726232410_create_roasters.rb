class CreateRoasters < ActiveRecord::Migration
  def change
    create_table :roasters do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.integer :user_id
      t.timestamps
    end
  end
end
