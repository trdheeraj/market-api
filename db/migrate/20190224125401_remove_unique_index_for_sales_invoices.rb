class RemoveUniqueIndexForSalesInvoices < ActiveRecord::Migration[5.2]
  def change
  	remove_index :sales_invoices, :customer_id
  	add_index :sales_invoices, :customer_id
  end
end
