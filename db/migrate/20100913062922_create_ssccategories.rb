class CreateSsccategories < ActiveRecord::Migration
  def self.up
    create_table :ssccategories do |t|

	t.string   :name
	t.float    :amount
	t.string   :description
	t.integer  :created_by, :null=>false
        t.integer  :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :ssccategories
  end
end
