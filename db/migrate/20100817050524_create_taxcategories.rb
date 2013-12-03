class CreateTaxcategories < ActiveRecord::Migration
  def self.up
    create_table :taxcategories do |t|

	t.string  :category, :limit=>25, :null=>false
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false


      t.timestamps
    end
  end

  def self.down
    drop_table :taxcategories
  end
end
