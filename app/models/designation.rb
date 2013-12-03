#Author: Chaitanya
#=========================

class Designation < ActiveRecord::Base
	has_many :empolyees
	has_many :bpays

	validates_presence_of :name


	#method : indexing on departmernt
	define_index do
		indexes name
	#with{}
	end

end
