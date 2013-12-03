#Author: Chaitanya
#=========================

class Department < ActiveRecord::Base
	has_many   :employees
	has_many   :bpays

	validates_presence_of :name

	#method : indexing on departmernt
	define_index do
		indexes name

	#with{}
	end
end	
