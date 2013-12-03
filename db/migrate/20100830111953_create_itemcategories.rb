class CreateItemcategories < ActiveRecord::Migration
  def self.up
    create_table :itemcategories do |t|

	t.string  :category_name
	t.text    :short_description
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :itemcategories
  end
end
