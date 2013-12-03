#Author: Chaitanya
#Table: employees
#belongs: 
class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|

	t.integer :employee_id, :null=>false, :limit=>10, :default =>10001 # TODO confirm with client
	t.string  :name, :limit=>100, :null=>false
	t.integer :gender_id,  :null=>false
	t.string  :father_name, :limit=>50, :null=>false
	t.date    :dob,  :null=>false
	t.date    :date_join, :null=>false
	t.integer :religion_id,  :null=>false
	t.integer :caste_id, :null=>false
	t.integer :marital_id,  :null=>false
	t.string  :education, :limit=>50, :null=>false	
	t.string  :blood_group,	:limit=>5, :null=>false
	t.string  :nationality, :limit=>20, :null=>false
	t.text	  :address, :null=>false	
	t.string  :phone, :limit=>11, :null=>false
	t.string  :mobile, :limit=>11, :null=>false
	t.string  :email, :limit=>100, :null=>false
	t.string  :photo, :limit=>100, :null=>false
	t.string  :pan, :limit=>11
	t.string  :pf_number, :limit=>10, :null=>false
	t.string  :bank_account_number, :limit=>20, :null=>false
	t.integer :bank_id, :null=>false
	t.integer :employeetype_id, :null=>false
	t.integer :employeecategory_id
	t.integer :designation_id, :null=>false	
	t.integer :department_id	
	t.string  :UID, :limit=>15, :null=>false	

	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
	
      t.timestamps
    end

  end



  def self.down
    drop_table :employees
  end
end
