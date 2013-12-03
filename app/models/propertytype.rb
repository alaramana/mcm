class Propertytype < ActiveRecord::Base
	has_many :properties	
        validates_presence_of :name	
	#method : indexing on Propertytype
	define_index do
		indexes name		
	#with{}
	end
	
end
