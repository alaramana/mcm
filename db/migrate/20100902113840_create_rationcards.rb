class CreateRationcards < ActiveRecord::Migration
  def self.up
    create_table :rationcards do |t|
	t.integer :rationcardtype_id
	t.integer :rationcard_number
	t.string  :owner_name
	t.string  :owner_photo
	t.date    :owner_birth_date
	t.integer :gender_id
	t.text    :owner_address
	t.string  :memeber_name1	
	t.date    :memeber1_birth_date
	t.integer :gender_id
	t.string  :relation1
	t.string  :memeber_name2
	t.date    :memeber2_birth_date
	t.integer :gender_id
	t.string  :relation2
	t.string  :memeber_name3	
	t.date    :memeber3_birth_date
	t.integer :gender_id
	t.string  :relation3
	t.string  :memeber_name4
	t.date    :memeber4_birth_date
	t.integer :gender_id
	t.string  :relation4
	t.string  :memeber_name5
	t.date    :memeber5_birth_date
	t.integer :gender_id
	t.string  :relation5
	t.string  :memeber_name6
	t.date    :memeber6_birth_date
	t.integer :gender_id
	t.string  :relation6
	t.date    :card_reg_date
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :rationcards
  end
end
