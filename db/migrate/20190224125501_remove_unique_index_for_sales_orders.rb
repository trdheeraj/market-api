class RemoveUniqueIndexForSalesOrders < ActiveRecord::Migration[5.2]
  def change
  	remove_index :sales_orders, :sales_invoice_id
  	add_index :sales_orders, :sales_invoice_id
  end
end
