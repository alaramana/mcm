#Author: Chaitanya
#model: Hra (For Salary)
#============================================
class CreateHras < ActiveRecord::Migration
  def self.up
    create_table :hras do |t|	

	t.integer  :department_id
	t.integer  :designation_id
	t.float    :hra_amount		
	t.text     :description
	
	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false
	
      t.timestamps
    end
  end

  def self.down
    drop_table :hras
  end
end
