class RemoveUniqueIndexForPurchaseOrder < ActiveRecord::Migration[5.2]
  def change
  	remove_index :purchase_orders, :purchase_invoice_id
  	add_index :purchase_orders, :purchase_invoice_id
  end
end
