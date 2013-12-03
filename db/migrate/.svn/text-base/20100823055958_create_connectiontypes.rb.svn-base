class CreateConnectiontypes < ActiveRecord::Migration
  def self.up
    create_table :connectiontypes do |t|

	t.string   :name
	t.text     :description
	t.float    :amount
	t.integer  :created_by, :null=>false
	t.integer  :modified_by, :null=>false


      t.timestamps
    end
  end

  def self.down
    drop_table :connectiontypes
  end
end
