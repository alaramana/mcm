#Author: Chaitanya
#-----------
class Taxcategory < ActiveRecord::Base
	has_many :unitvalues

	validates_presence_of :category

	 #Method: Indexing on Taxcategory
	define_index do
		indexes category		
		#with{}		
	end
end
