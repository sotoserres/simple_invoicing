class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.datetime :date
      t.string :paymenttype
      t.float :value
      t.float :vat
      t.float :payable
      t.integer :user_id
      t.integer :category
      t.string :order
      t.boolean :paid
      t.float :balance
      t.timestamps
    end
  end
end
