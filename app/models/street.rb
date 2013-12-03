#Author: Chaitanya
#----------------
class Street < ActiveRecord::Base	
	belongs_to :organization
	belongs_to :ward
	validates_presence_of :name		


	 #Method: Indexing on street name
	define_index do
		indexes :name
		
		#with{}
		
	end

end
