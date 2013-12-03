class CreateSeasonallicenses < ActiveRecord::Migration
  def self.up
    create_table :seasonallicenses do |t|
	
	t.string  :first_name
	t.string  :last_name
	t.integer :gender_id
	t.text    :address
	t.string  :shop_name
	t.integer :shop_number
	t.text    :shop_address
	t.date    :start_date
	t.date    :end_date
	t.float   :amount
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :seasonallicenses
  end
end
