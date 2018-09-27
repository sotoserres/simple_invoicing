class CreateTractors < ActiveRecord::Migration[5.2]
  def change
    create_table :tractors do |t|
      t.string :Name
      t.string :Plates
      t.datetime :dob
      t.datetime :lastservice
      t.datetime :filterhours
      t.datetime :oilhours
      t.datetime :twh
      t.string :observations
      t.integer :user_id
      t.timestamps
    end
  end
end
