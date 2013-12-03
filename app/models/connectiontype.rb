#Author: Chaitanya
#=======
class Connectiontype < ActiveRecord::Base
#	has_many :wtaxes
	has_many :ptaxregistrations

	validates_presence_of :name
	
	#method indexing on connectiontype,amount
	define_index do
		indexes name
		indexes amount
	#with{}
	end
end
