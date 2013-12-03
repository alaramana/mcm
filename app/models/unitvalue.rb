#Author: Chaitanya
#===================
class Unitvalue < ActiveRecord::Base
	belongs_to :taxcategory
	has_many   :ptaxes 

	validates_presence_of :amount	

	#Method: Indexing on Unitvalue
	define_index do
		indexes :amount		
		#with{}
	end
end
