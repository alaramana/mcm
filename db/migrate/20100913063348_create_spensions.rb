class CreateSpensions < ActiveRecord::Migration
  def self.up
    create_table :spensions do |t|
	t.integer  :spension_number
	t.integer  :ssccategory_id
	t.string   :first_name
	t.string   :last_name
	t.integer  :gender_id
	t.date     :date_of_birth
	t.string   :photo
	t.date	   :reg_date
	t.integer  :age
	t.text     :address
	t.text     :description
	t.boolean  :approved, :default=>0
	t.integer  :created_by, :null=>false
        t.integer  :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :spensions
  end
end
