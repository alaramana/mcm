class CreateRationcardtypes < ActiveRecord::Migration
  def self.up
    create_table :rationcardtypes do |t|
	t.string  :card_type
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :rationcardtypes
  end
end
