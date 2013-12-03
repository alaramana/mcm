class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|

	t.string  :name, :limit=>100, :null=>false
	t.integer :propertytype_id, :null=>false 
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
