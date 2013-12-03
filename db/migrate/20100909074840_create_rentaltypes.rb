class CreateRentaltypes < ActiveRecord::Migration
  def self.up
    create_table :rentaltypes do |t|
      t.string   :rental_type
      t.integer  :amount
      t.text     :description
      t.integer  :created_by, :null=>false
      t.integer  :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :rentaltypes
  end
end
