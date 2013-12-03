class CreatePtaxpayments < ActiveRecord::Migration
  def self.up
    create_table :ptaxpayments do |t|

	t.integer :ptax_id
	t.float   :total_amount
	t.float   :paid_amount
	t.float   :balance_amount
	t.string  :paymentmode
	t.string  :bank_name
	t.string  :cheque_number
	t.text    :remark

	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :ptaxpayments
  end
end
