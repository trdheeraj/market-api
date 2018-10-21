class CreateSupplierTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_transactions do |t|
    	t.integer :supplier_id
    	t.datetime :date
    	t.string :payment_type
    	t.float :amount
    	t.float :balance_amount
    	t.integer :purchase_invoice_id

    	t.timestamps
    end

    add_index :supplier_transactions, :supplier_id, unique: true
  end
end
