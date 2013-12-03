#------
#Author: Chaitanya
#----------------

class Organizationtype < ActiveRecord::Base
	
	has_many :organizations

	validates_presence_of :name

	#method : indexing on Organization
	define_index do
		indexes name
		

	#with{}
		
	end
	
end
