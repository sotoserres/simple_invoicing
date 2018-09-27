class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.datetime :date
      t.string :user_id
      t.string :description

      t.timestamps
    end
  end
end
