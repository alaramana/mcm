class CreateStorecunsumptions < ActiveRecord::Migration
  def self.up
    create_table :storecunsumptions do |t|

	t.integer :itemmaster_id
	t.integer :department_id
	t.integer :quantity 	
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :storecunsumptions
  end
end
