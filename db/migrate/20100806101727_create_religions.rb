#Author: Chaitnya
#table: religions
#belongs: 
#===================

class CreateReligions < ActiveRecord::Migration
  def self.up
    create_table :religions do |t|
	
	t.string  :name, :null=>false, :limit=>20
	t.text	  :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end



  end

  def self.down
    drop_table :religions
  end
end
