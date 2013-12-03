#--------------------------
#Author: Chaitanya
#table: hospitals
#belongs:
#-------------------------------

class CreateHospitals < ActiveRecord::Migration
  def self.up
    create_table :hospitals do |t|

	t.string  :name, :null=>false, :limit=>50
	t.text    :address, :null=>false
	t.string  :city, :null=>false, :limit=>50
	t.string  :tehsil, :null=>false, :limit=>50
	t.string  :district, :null=>false, :limit=>50
	t.string  :phone1, :null=>false, :limit=>11
	t.string  :phone2, :null=>false, :limit=>11
	t.string  :doctor, :null=>false, :limit=>50
	t.string  :education, :null=>false, :limit=>50
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false


      t.timestamps
    end
  end

  def self.down
    drop_table :hospitals
  end
end
