#Author: Chaitanya
#table: genders
#belongs: 
class CreateGenders < ActiveRecord::Migration
  def self.up
    create_table :genders do |t|

	t.string  :name, :limit=>10, :null=>false
	t.text	  :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end


  end

  def self.down
    drop_table :genders
  end
end
