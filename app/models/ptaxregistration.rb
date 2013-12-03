#Author: Chaitanya
#Model: Property Tax Registration
#===============================================
class Ptaxregistration < ActiveRecord::Base

	belongs_to :zone
	belongs_to :ward
	belongs_to :street
	has_many   :ptaxes
	belongs_to :connectiontypes
	
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :door_number
	validates_presence_of :area
	
	#Method: Indexing on Property Tax Registration
	define_index do		
		indexes number
		indexes register_date
		indexes door_number
		indexes phone
		indexes email
		indexes mobile
		indexes zone.name
		indexes ward.name
		indexes street.name

	#with{}
		has zone_id,ward_id,street_id
	end				 

	#method define maximum of Register id
	def max
		Ptaxregistration.maximum(:number)
	end
	#end: max

end
