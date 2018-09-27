class RemoveTypeFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :type, :string
  end
end
