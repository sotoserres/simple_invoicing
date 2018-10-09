class AddAfmToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :afm, :string
  end
end
