#Author: Chaitanya
#=========================

class Caste < ActiveRecord::Base
	#relations
	has_many   :employees
	belongs_to :religion
	has_many   :births
	has_many   :deaths

	#validations
	validates_presence_of :name


	#indexing on castes
	define_index do
		indexes name
		indexes religion.name

		#with{}
		has religion_id
	end
	#end: Index
end
