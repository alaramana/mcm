#Author: Chaitanya
#Table: castes
#belongs: 
#============================

class CreateCastes < ActiveRecord::Migration
  def self.up
    create_table :castes do |t|

	t.string  :name, :limit=>20, :null=>false
    t.integer :religion_id
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end



  end

  def self.down
    drop_table :castes
  end
end
