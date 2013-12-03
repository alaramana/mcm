class CreateGoodsreceives < ActiveRecord::Migration
  def self.up
    create_table :goodsreceives do |t|

	t.integer :itemmaster_id
	t.integer :quantity
	t.float   :amount
	t.date    :received_date
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :goodsreceives
  end
end
