#Author: Chaitanya
#Model: Zone
#---------------
class Zone < ActiveRecord::Base

	has_many 	:wards			#Wards
	has_many 	:registrations 	#Property Tax
	has_many 	:wtaxes 		#Water Tax
	belongs_to	:organization	#Organization

	validates_presence_of :name
	
	#Method: Indexing on Name
	define_index do
		indexes :name
	end
end
