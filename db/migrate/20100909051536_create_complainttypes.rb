class CreateComplainttypes < ActiveRecord::Migration
  def self.up
    create_table :complainttypes do |t|
      t.string   :complaint_type    
      t.text     :description
      t.integer  :created_by, :null=>false
      t.integer  :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :complainttypes
  end
end
