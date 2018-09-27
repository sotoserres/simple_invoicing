class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :surname
      t.string :name
      t.string :fathername
      t.string :telephone
      t.string :cellphone
      t.datetime :dob
      t.string :email
      t.string :city
      t.string :address
      t.string :activity
      t.timestamps
    end
  end
end
