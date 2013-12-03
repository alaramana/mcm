#Author: Chaitanya
#=========================

class Religion < ActiveRecord::Base
	has_many :employees
	has_many :births
	has_many :deaths
    has_many :castes

	validates_presence_of :name


	#Method indexing on religion name
	define_index do
		indexes name
	end
end
