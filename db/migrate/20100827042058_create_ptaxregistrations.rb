class CreatePtaxregistrations < ActiveRecord::Migration
  def self.up
    create_table :ptaxregistrations do |t|

	t.date    :register_date
	t.integer :number, :null=>false, :limit=>10			#Registration Number
	t.string  :first_name
	t.string  :last_name
	t.string  :area
	t.string  :door_number
	t.string  :apartment_name
	t.string  :email
	t.integer :phone
	t.integer :mobile
	t.text    :description	
	t.integer :zone_id
	t.integer :ward_id	
	t.integer :street_id
	t.integer :floors
    t.integer :waterconnection
	t.integer :connectiontype_id


	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :ptaxregistrations
  end
end
