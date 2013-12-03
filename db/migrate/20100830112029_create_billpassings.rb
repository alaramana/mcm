#Author: Krishnaveni
#=========================
class CreateBillpassings < ActiveRecord::Migration
  def self.up
    create_table :billpassings do |t|
	
	t.integer :invoice_number
	t.date    :invoice_date
	t.float   :amount
	t.string  :org_name
	t.text    :address
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :billpassings
  end
end
