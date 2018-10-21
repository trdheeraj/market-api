class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.string :address
    	t.string :address_2
    	t.string :district
    	t.string :state
    	t.integer :postal_code

    	t.timestamps
    end
  end
end
