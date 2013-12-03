#Author: Chaitanya
#=========================

class Marital < ActiveRecord::Base
	has_many :employees

	validates_presence_of :status, :message=>"Enter Characters Only!"

	#method : indexing on Marital Status
	define_index do
		indexes status

	#with{}
	end

end
