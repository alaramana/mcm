#Author: Chaitanya
#====================
class Tax < ActiveRecord::Base
	has_many :ptaxes

	validates_presence_of :name
	validates_presence_of :amount
	

	 #Method: Indexing on Tax
	define_index do
		indexes :name
		indexes amount
		#with{}
	end
end
