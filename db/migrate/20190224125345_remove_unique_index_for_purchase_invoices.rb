class RemoveUniqueIndexForPurchaseInvoices < ActiveRecord::Migration[5.2]
  def change
  	remove_index :purchase_invoices, :supplier_id
  	add_index :purchase_invoices, :supplier_id
  end
end
