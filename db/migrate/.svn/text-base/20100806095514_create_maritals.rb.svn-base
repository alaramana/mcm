#Author: Chaitanya
#Table: maritals
#Belongs: Empolyee

class CreateMaritals < ActiveRecord::Migration
  def self.up
    create_table :maritals do |t|

	t.string  :status, :null=>false, :limit=>20
	t.text	  :description
	t.integer :created_by, :null=>false
	t.integer :modified_by,:null=>false
	
      t.timestamps
    end


  end

  def self.down
    drop_table :maritals
  end
end
