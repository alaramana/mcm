#Author: Chaitanya
#table: department
#belongs:
#=========================

class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|

	t.string  :name, :limit=>50, :null=>false
	t.string  :short_code, :null=>false, :limit=>50
	t.text	  :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end


  end

  def self.down
    drop_table :departments
  end
end
