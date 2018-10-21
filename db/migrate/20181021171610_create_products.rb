class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :quantity
    	t.float :rate
    	t.string :hsn
    	t.string :gst

    	t.timestamps
    end

    add_index :products, :name, unique: true
  end
end
