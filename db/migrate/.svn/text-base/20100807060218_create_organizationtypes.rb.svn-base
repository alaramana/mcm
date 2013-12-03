#--------------------------------------
#Author: Chaitanya
#table: organizationtypes
#belongs:
#--------------------------------------

class CreateOrganizationtypes < ActiveRecord::Migration
  def self.up
    create_table :organizationtypes do |t|

	t.string  :name, :limit=>50, :null=>false
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end


 
  end

  def self.down
    drop_table :organizationtypes
  end



end
