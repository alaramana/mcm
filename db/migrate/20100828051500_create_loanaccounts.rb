class CreateLoanaccounts < ActiveRecord::Migration
  def self.up
    create_table :loanaccounts do |t|

		t.integer  :employee_id
		t.integer  :loanaccountno
		t.float	   :loan_amount
		t.float    :interest
		t.integer  :emi
		t.float    :total
		t.float	   :paid_amount
		t.float    :balance_amount
		t.integer  :created_by, :null=>false
		t.integer  :modified_by, :null=>false
		t.timestamps
    end
  end

  def self.down
    drop_table :loanaccounts
  end
end
