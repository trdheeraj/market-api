class ChangeIntegerLimitInSupplier < ActiveRecord::Migration[5.2]
  def change
  	change_column :suppliers, :mobile, :integer, limit: 8
  end
end
