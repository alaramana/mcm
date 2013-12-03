#Author: Chaitanya
#==================
class CreateWtaxes < ActiveRecord::Migration
  def self.up
    create_table :wtaxes do |t|

	t.date     :register_date
	t.integer   :wtax_number
	t.string   :name
	t.string   :door_number
	t.string   :address
	t.integer   :phone
	t.string   :email
	t.integer   :mobile	
	t.integer  :connectiontype_id      
	t.date     :start_year
	t.date     :end_year	

	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false


      t.timestamps
    end
  end

  def self.down
    drop_table :wtaxes
  end
end
