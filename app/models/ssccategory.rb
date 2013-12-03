#Author: Krishnaveni
#==============
class Ssccategory < ActiveRecord::Base
	has_many  :spensions
        validates_presence_of :name
        define_index do
		indexes name
		indexes amount
		#with{}
		
	end
end
