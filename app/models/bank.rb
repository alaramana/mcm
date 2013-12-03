#Author: Chaitanya
#========================
class Bank < ActiveRecord::Base
	has_many :employees
	
	validates_presence_of :name
	validates_presence_of :branch


	#Method: Indexing on Name
	define_index do
		indexes name
		indexes branch
		indexes branch_code
		indexes manager

	end

end
