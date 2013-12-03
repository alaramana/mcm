#--------------------------
#Author: Chaitanya
#table: deaths
#belongs:
#-----------------------------

class CreateDeaths < ActiveRecord::Migration
  def self.up
    create_table :deaths do |t|

	t.date     :death_date, :null=>false
	t.string   :first_name, :limit=>50
	t.string   :middle_name, :limit=>50
	t.string   :last_name, :limit=>50
	t.string   :father_name, :limit=>100, :null=>false
	t.integer  :gender_id, :null=>false
	t.integer  :age, :null=>false, :limit=>3
	t.text     :address
	t.string   :death_place, :null=>false, :limit=>20	  # Hospital/Home/Other
	t.integer  :hospital_id, :null=>false			  # Id from hospitals table
	t.string   :city, :limit=>50
	t.string   :tehsil, :limit=>50
	t.string   :district, :limit=>50
	t.string   :applicant, :limit=>100, :null=>false
	t.integer  :religion_id,  :null=>false
	t.integer  :caste_id,  :null=>false

	t.string   :death_before_treatment, :limit=>50		 # Died with Treatment - Govt/Private/No
	t.string   :death_with_illness, :limit=>5	         # Death with Any Illness YES/NO
	t.string   :desease_name, :limit=>50			 # Name of the Desease
	t.string   :death_delivery, :limit=>5 	                 # Women dead at time of Delivery YES/No
	t.string   :death_cause_smoke, :limit=>5		 # Death is caused by smoking  YES/No
	t.integer  :death_smoke_age, :limit=>2                   # If Yes how may years of smoking
	t.string   :death_cause_supari, :limit=>5                # Death is caused by eating supari  YES/No 
	t.integer  :death_supari_age, :limit=>2			 # If Yes how may years of eating supari
	t.string   :death_cause_drink, :limit=>5                 # Death is caused by habit of Drink  YES/No 
	t.integer  :death_drink_age, :limit=>2			 # If Yes how may years of Drink
	t.integer  :register_id, :limit=>10, :null=>false	 #TODO confirm with Client
	t.date     :register_date, :null=>false
	t.string   :remarks, :limit=>100
	t.float    :amount
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
    drop_table :deaths
  end
end
