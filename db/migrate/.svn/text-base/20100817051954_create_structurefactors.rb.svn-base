class CreateStructurefactors < ActiveRecord::Migration
  def self.up
    create_table :structurefactors do |t|

	t.string  :name, :limit=>100, :null=>false
	t.float   :factor, :null=>false 
	t.text    :description
	t.integer :created_by, :null=>false
	t.integer :modified_by, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :structurefactors
  end
end
