class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      t.integer  :license_number
      t.string   :first_name, :limit=>50
      t.string   :last_name, :limit=>50
      t.string   :father_name, :limit=>50
      t.string   :shop_name, :limit=>50
      t.string   :shop_address1, :limit=>50
      t.string   :shop_address1, :limit=>50
      t.integer  :street_id, :limit=>50     
      t.integer  :ward_id, :limit=>50	    
      t.integer  :licensetype_id
      t.integer  :period_from
      t.integer  :period_to     
      t.text     :description
      t.integer  :created_by, :null=>false
      t.integer  :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :licenses
  end
end
