class CreateRoasts < ActiveRecord::Migration
  def change
    create_table(:roasts) do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :ounces
      t.belongs_to :roaster, index: true
      t.timestamps()
    end
  end
end
