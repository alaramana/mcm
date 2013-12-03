#Author: Chaitanya
#model: DA (For Salary)
#=============================================
class CreateDas < ActiveRecord::Migration
  def self.up
    create_table :das do |t|    	

    	t.float   :da_amount
    	t.text    :description    	
		t.integer  :created_by, :null=>false
		t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :das
  end
end
