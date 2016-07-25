class AddCropToRoast < ActiveRecord::Migration
  def change
    add_column :roasts, :crop_id, :integer
  end
end
