#Author: Krishnaveni
#======================
class Licensetype < ActiveRecord::Base 
  has_many :licenses
  validates_presence_of :lic_type
	#method : indexing on Licensetype
	define_index do
		indexes lic_type	
		

	#with{}
	
	end
end
