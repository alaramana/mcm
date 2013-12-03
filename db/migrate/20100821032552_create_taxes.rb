#Author: Chaitanya
#===========
class CreateTaxes < ActiveRecord::Migration
  def self.up
    create_table :taxes do |t|

	t.string  :name, :null=>false 
	t.float   :amount, :null=>false
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :taxes
  end
end
