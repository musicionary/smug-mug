class CreateCustomersRoastsJoinTable < ActiveRecord::Migration
  def change
    create_join_table(:customers, :roasts) do |t|
      t.timestamps()
    end
  end
end
