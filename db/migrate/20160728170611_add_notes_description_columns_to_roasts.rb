class AddNotesDescriptionColumnsToRoasts < ActiveRecord::Migration
  def change
    add_column(:roasts, :notes, :string)
    add_column(:roasts, :roast_date, :date)
    add_column(:roasts, :roast_type, :string)
    add_column(:roasts, :description, :text)
    add_column(:roasts, :ounces, :integer)
    remove_column(:roasts, :weight)
  end
end
