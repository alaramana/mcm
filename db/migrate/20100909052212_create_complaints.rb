class CreateComplaints < ActiveRecord::Migration
  def self.up
    create_table :complaints do |t|
      t.integer  :complaint_number
      t.integer  :complainttype_id
      t.integer  :department_id
      t.text     :complaint_dec
      t.date     :complaint_date
      t.integer  :resolve_time
      t.boolean  :approved, :default=>0
      t.integer :created_by, :null=>false
      t.integer :modified_by, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :complaints
  end
end
