class CreateSalaries < ActiveRecord::Migration
  def self.up
    create_table :salaries do |t|
    
    	t.integer  :employee_id
    	t.integer  :bpay_id
    	t.float    :pf_amount
    	t.float    :tax_amount
    	t.float    :allowences
    	t.float    :deductions
    	t.float	   :gross_salary
    	t.float    :net_salary
    		
		t.integer  :created_by, :null=>false
		t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :salaries
  end
end
