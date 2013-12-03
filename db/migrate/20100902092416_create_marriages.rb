class CreateMarriages < ActiveRecord::Migration
  def self.up
    create_table :marriages do |t|
	t.integer :marriage_reg_number
	t.string  :groom_name, :null=>false
	t.string  :groom_father, :null=>false
	t.string  :groom_mother, :null=>false
	t.date	  :groom_birth_date
	t.string  :groom_photo
	t.text    :groom_address
	t.string  :groom_district
	t.string  :groom_state
	t.string  :groom_country
	t.string  :bride_name, :null=>false
	t.string  :bride_father, :null=>false
	t.string  :bride_mother, :null=>false
	t.date    :bride_birth_date
	t.string  :bride_photo
	t.text    :bride_address
	t.string  :bride_district
	t.string  :bride_state
	t.string  :bride_country
	t.date    :marriage_date
	t.string  :marriage_place
	t.boolean  :approved, :default=>0
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :marriages
  end
end
