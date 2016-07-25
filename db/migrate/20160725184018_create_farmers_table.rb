class CreateFarmersTable < ActiveRecord::Migration
  def change
    create_table(:farmers) do |t|
      t.string(:name)
      t.string(:email)
      t.string(:password)
      t.integer(:user_type)
      t.timestamps()
    end
  end
end
