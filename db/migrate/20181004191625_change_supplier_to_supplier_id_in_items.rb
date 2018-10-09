class ChangeSupplierToSupplierIdInItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :supplier, :supplier_id
  end
end
