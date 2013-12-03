class CreateGoodsreturns < ActiveRecord::Migration
  def self.up
    create_table :goodsreturns do |t|

	t.integer :itemmaster_id
	t.integer :quantity
	t.float   :amount
	t.date    :return_date
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
	
      t.timestamps
    end
  end

  def self.down
    drop_table :goodsreturns
  end
end
