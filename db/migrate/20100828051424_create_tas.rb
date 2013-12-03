#Author: Chaitanya
#model: DA (for Salary Calculaltions)
#===========================================
class CreateTas < ActiveRecord::Migration
  def self.up
    create_table :tas do |t|

    	t.float   :ta_percentage
    	t.text    :description    	
		t.integer  :created_by, :null=>false
		t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :tas
  end
end
