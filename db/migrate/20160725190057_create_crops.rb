class CreateCrops < ActiveRecord::Migration
  def change
    create_table(:crops) do |t|
      t.belongs_to :farmer, index: true
      t.belongs_to :roaster, index: true
      t.string(:country_of_origin)
      t.string(:elevation)
      t.string(:varietal)
      t.date(:harvest_date)
      t.decimal(:price, precision: 8, scale: 2)
      t.integer(:ounces)
      t.timestamps()
    end
  end
end
