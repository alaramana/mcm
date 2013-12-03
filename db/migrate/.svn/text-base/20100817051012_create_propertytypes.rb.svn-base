class CreatePropertytypes < ActiveRecord::Migration
  def self.up
    create_table :propertytypes do |t|

	t.string  :name, :limit=>100, :null=>false
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :propertytypes
  end
end
