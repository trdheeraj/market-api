class RemoveUniqueIndexForSupplierTransactions < ActiveRecord::Migration[5.2]
  def change
  	remove_index :supplier_transactions, :supplier_id
  	add_index :supplier_transactions, :supplier_id
  end
end
