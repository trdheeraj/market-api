class CreatePurchaseInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_invoices do |t|
    	t.integer :bill_number
    	t.integer :supplier_id
    	t.datetime :date
    	t.float :discount
    	t.string :payment_type
    	t.float :amount

    	t.timestamps
    end

    add_index :purchase_invoices, :bill_number, unique: true
    add_index :purchase_invoices, :supplier_id, unique: true
  end
end
