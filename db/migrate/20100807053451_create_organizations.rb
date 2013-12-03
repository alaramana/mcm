#Author: Chaitanya
#table: organizations
#belongs_to : organizationtypes
#==================

class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|

	t.string   :long_name, :null=>false, :limit=>50		#Full Name
	t.string   :short_name, :null=>false, :limit=>50	#Short Name
	t.integer  :organizationtype_id, :limit=>3		# Type of Organization
	t.text     :address, :null=>false
	t.string   :city, :null=>false, :limit=>50
	t.string   :tehsil, :null=>false, :limit=>50
	t.string   :district, :null=>false, :limit=>50
	t.string   :state, :null=>false, :limit=>50
	t.string   :country, :null=>false, :limit=>50
	t.integer  :pin, :null=>false, :limit=>10
	t.string   :phone_number1, :null=>false, :limit=>11
	t.string   :phone_number2, :limit=>11
	t.string   :phone_number3,  :limit=>11
	t.string   :fax_number1, :null=>false, :limit=>11
	t.string   :fax_number2, :limit=>11
	t.string   :toll_free1,  :limit=>15
	t.string   :toll_free2,  :limit=>15
	t.string   :service_line, :limit=>15
	t.string   :email, :null=>false, :limit=>75
	t.string   :web, :null=>false, :limit=>50
	t.text     :about					#About Organization
	t.text     :info 					#Information about Organization
	t.string   :coordinates, :limit=>50			#Geographic CoOrdinates

	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false 


      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
