class CreateLicensetypes < ActiveRecord::Migration
  def self.up
    create_table :licensetypes do |t|
      t.string   :lic_type
      t.integer  :amount
      t.text     :description
      t.integer  :created_by, :null=>false
      t.integer  :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :licensetypes
  end
end
