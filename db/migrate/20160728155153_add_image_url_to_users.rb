class AddImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column(:farmers, :image_url, :string)
    add_column(:roasters, :image_url, :string)
  end
end
