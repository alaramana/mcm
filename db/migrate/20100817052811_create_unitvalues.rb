class CreateUnitvalues < ActiveRecord::Migration
  def self.up
    create_table :unitvalues do |t|

	t.integer :taxcategory_id, :null=>false 
	t.float   :amount, :null=>false
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :unitvalues
  end
end
