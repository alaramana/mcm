#Author: Chaitanya
#table: designations
#belongs:
#========================


class CreateDesignations < ActiveRecord::Migration
  def self.up
    create_table :designations do |t|
	
	t.string  :name, :null=>false, :limit=>50
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end

  end

  def self.down
    drop_table :designations
  end
end
