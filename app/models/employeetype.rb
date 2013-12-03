#Author: Chaitnya
#-------

class Employeetype < ActiveRecord::Base
	has_many :employees

	validates_presence_of :name
	
	#method : indexing on Employeetype
	define_index do
		indexes name
	#with{}
		
	end

end
