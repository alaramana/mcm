class CreateStreets < ActiveRecord::Migration
  def self.up
    create_table :streets do |t|

	t.string  :name, :limit=>100, :null=>false
	t.integer :ward_id, :null=>false	
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
  

      t.timestamps
    end
  end

  def self.down
    drop_table :streets
  end
end
