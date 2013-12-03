class CreatePtaxes < ActiveRecord::Migration
  def self.up
    create_table :ptaxes do |t|
    
	t.integer :assessment_number
	t.integer :ptaxregistration_id
	t.date	  :invoice_date
	t.integer :start_year
	t.integer :end_year
	t.float   :total_area
	t.float   :build_area
        t.integer :propertytype_id
	t.integer :taxcategory_id	
	t.integer :occupancyfactor_id	
	t.integer :structurefactor_id	
	t.integer :unitvalue_id	
	t.float   :total

	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false



      t.timestamps
    end
  end

  def self.down
    drop_table :ptaxes
  end
end

