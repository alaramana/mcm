class CreateBirths < ActiveRecord::Migration
  def self.up
    create_table :births do |t|

	t.date     :birth_date, :null=>false
	t.string   :first_name, :limit=>50
	t.string   :middle_name, :limit=>50
	t.string   :last_name, :limit=>50
	t.string   :father_name, :limit=>100, :null=>false
	t.string   :mother_name, :limit=>100, :null=>false
	t.integer  :gender_id, :null=>false
	t.text     :address
	t.integer  :caste_id, :null=>false	
	t.string   :birth_place, :null=>false, :limit=>20	  # Hospital/Home/Other
	t.integer  :hospital_id			  # Id from hospitals table
	t.string   :city, :limit=>50
	t.string   :tehsil, :limit=>50
	t.string   :district, :limit=>50
	t.string   :applicant, :limit=>100, :null=>false
	t.integer  :religion_id,  :null=>false
	t.string   :mother_native, :limit=>50
	t.string   :father_education, :limit=>50
	t.string   :mother_education, :limit=>50
	t.string   :father_occupation, :limit=>50
	t.string   :mother_occupation, :limit=>50
	t.integer  :mother_age_marriage, :limit=>2  # mother completed age at time of Marriage
	t.integer  :mother_age_delivery, :limit=>2  # Mother completed age at time of Delivery 
	t.float    :weight
	t.integer  :total_children, :limit=>2
	t.integer  :deliverymethod_id, :null=>false			 #Id From delivery_methods table	   
	t.integer  :total_time, :limit=>2
	t.string   :helper, :limit=>50, :null=>false
	t.integer  :register_id, :limit=>10, :null=>false	#TODO confirm with Client
	t.date     :register_date
	t.string   :remarks, :limit=>100
    t.string   :unit,   :limit=>100
	t.float	   :amount
	t.integer  :copies
	t.integer  :employee_id,  :null=>false
	t.integer  :approved_by
	t.date     :approved_on
	t.integer  :created_by, :null=>false
	t.integer  :modified_by,:null=>false
    t.boolean  :approved, :default=>0
    
    t.timestamps
    end
  end

  def self.down
    drop_table :births
  end
end
