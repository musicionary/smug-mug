class DeleteCropsCustomerRoastsTables < ActiveRecord::Migration
  def change
    drop_table(:crops)
    drop_join_table(:customers, :roasts)
  end
end
