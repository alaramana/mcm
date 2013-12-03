#Author: Chaitanya
#=========================

class Gender < ActiveRecord::Base
	has_many :employees			#,:dependent=>:destroy
	has_many :births
	has_many :deaths

	validates_presence_of :name
	
	#method : indexing on Genders
	define_index do
		indexes name
	#with{}
	end

end
