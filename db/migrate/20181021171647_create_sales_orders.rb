class CreateSalesOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_orders do |t|
    	t.integer :sales_invoice_id
    	t.integer :product_id
    	t.integer :quantity

    	t.timestamps
    end

    add_index :sales_orders, :sales_invoice_id, unique: true
  end
end
