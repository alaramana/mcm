class CreateEmployeetypes < ActiveRecord::Migration
  def self.up
    create_table :employeetypes do |t|

	t.string   :name, :limit=>50, :null=>false
	t.text     :description
	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :employeetypes
  end
end
