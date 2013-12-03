#Author: Chaitanya
#Model: Employee Category
#===================================
class Employeecategory < ActiveRecord::Base
has_many :employees

	validates_presence_of :name
	
	#method : indexing on Employeecategory
	define_index do
		indexes name
	#with{}
	end
end
