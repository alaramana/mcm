#Author: Chaitanya
#Model: Wards
#-----------
class Ward < ActiveRecord::Base

	belongs_to :organization
	belongs_to :zone
	has_many   :Street
   	has_many   :registrations  #Property Tax
	has_many   :wtaxes   #Water Tax

	validates_presence_of :name
	
  #Method: Indexing on ward name
	define_index do
		indexes :name
		indexes zone.name

	#with{}
		has zone_id
	end
	
end
