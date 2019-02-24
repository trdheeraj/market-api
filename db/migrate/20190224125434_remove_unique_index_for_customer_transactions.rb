class RemoveUniqueIndexForCustomerTransactions < ActiveRecord::Migration[5.2]
  def change
  	remove_index :customer_transactions, :customer_id
  	add_index :customer_transactions, :customer_id
  end
end
