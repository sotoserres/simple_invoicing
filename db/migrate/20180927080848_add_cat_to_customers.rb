class AddCatToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :cat, :integer
  end
end
