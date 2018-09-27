class CreateMachineries < ActiveRecord::Migration[5.2]
  def change
    create_table :machineries do |t|
      t.string :name
      t.datetime :dob
      t.string :condition
      t.string :warranty
      t.integer :user_id

      t.timestamps
    end
  end
end
