class ChangeTractorNamePlates < ActiveRecord::Migration[5.2]
  def change
    rename_column :tractors, :Name, :name
    rename_column :tractors, :Plates, :plates
    rename_column :tractors, :user_id, :customer_id
  end
end
