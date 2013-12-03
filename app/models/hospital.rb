#Author: Chaitanya
#---------------------

class Hospital < ActiveRecord::Base
	has_many :births
	has_many :deaths

	validates_presence_of :name
	validates_presence_of :doctor	
	#method : indexing on Hospitals
	define_index do
		indexes name
		indexes	doctor
		indexes	tehsil
		indexes	city
		indexes	district

	#with{}
	end

end
