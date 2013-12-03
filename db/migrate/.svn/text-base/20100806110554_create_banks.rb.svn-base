#Author: Chaitanya
#table: banks
#belongs:
#============================

class CreateBanks < ActiveRecord::Migration
  def self.up
    create_table :banks do |t|

	t.string  :name, :limit=>50, :null=>false
	t.string  :branch, :null=>false, :limit=>50
	t.integer :branch_code, :null=>false, :limit=>15
	t.text    :address, :null=>false
	t.string  :phone1, :null=>false, :limit=>11
	t.string  :phone2, :limit=>11
	t.string  :manager, :limit=>50
	t.string  :manager_contact, :limit=>50
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end

  end

  def self.down
    drop_table :banks
  end
end
