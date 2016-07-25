class CreateCustomers < ActiveRecord::Migration
  def change
    create_table(:customers) do |t|
      t.string :name
      t.string(:street)
      t.string(:city)
      t.string(:state)
      t.string(:zip)
      t.string(:phone_number)
      t.string(:email)
      t.string(:password)
      t.integer(:user_type)
      t.timestamps()
    end
  end
end
