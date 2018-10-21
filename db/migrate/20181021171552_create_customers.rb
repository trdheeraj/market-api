class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
    	t.string :name
    	t.integer :address_id
    	t.integer :mobile
    	t.string :email

    	t.timestamps
    end

    add_index :customers, :name, unique: true
    add_index :customers, :email, unique: true
    add_index :customers, :mobile, unique: true
  end
end
