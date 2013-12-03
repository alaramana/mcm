class CreateBpays < ActiveRecord::Migration
  def self.up
    create_table :bpays do |t|
    
    	t.integer :department_id
    	t.integer :designation_id
    	t.float   :bpay_amount
    	t.text    :description
    	
		t.integer  :created_by, :null=>false
		t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :bpays
  end
end
