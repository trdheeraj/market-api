class ChangeIntegerLimitInCustomer < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :mobile, :integer, limit: 8
  end
end
