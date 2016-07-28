class AddImageColumnToRoasts < ActiveRecord::Migration
  def change
    add_column(:roasts, :image_url, :string)
  end
end
