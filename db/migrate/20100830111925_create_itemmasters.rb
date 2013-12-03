class CreateItemmasters < ActiveRecord::Migration
  def self.up
    create_table :itemmasters do |t|
	
	t.integer :itemcategory_id	
	t.string  :item_name
	t.integer :quantity
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :itemmasters
  end
end
