class CreateCustomerTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_transactions do |t|
    	t.integer :customer_id
    	t.datetime :date
    	t.string :payment_type
    	t.float :amount
    	t.float :balance_amount
    	t.integer :sales_invoice_id

    	t.timestamps
    end

    add_index :customer_transactions, :customer_id, unique: true
  end
end
