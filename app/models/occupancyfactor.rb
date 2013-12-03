#Author: Chaitanya
#======================
class Occupancyfactor < ActiveRecord::Base
	has_many :ptaxregistrations

	validates_presence_of :name
	validates_presence_of :factor
	
	#method : indexing on Occupancyfactor
	define_index do
		indexes name
		indexes factor

	#with{}
	end
	has_many :ptaxes
end
