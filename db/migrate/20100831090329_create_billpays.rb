#Author: Krishnaevni
#=========================
class CreateBillpays < ActiveRecord::Migration
  def self.up
    create_table :billpays do |t|

	t.integer  :invoice_number
	t.date     :date
	t.float    :amount
	t.float    :paid_amount
	t.text     :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
	
	
      t.timestamps
    end
  end

  def self.down
    drop_table :billpays
  end
end
