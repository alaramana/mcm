class Property < ActiveRecord::Base
	belongs_to :propertytype
        validates_presence_of :name	
	#method : indexing on Property
	define_index do
		indexes name		
			#with{}
		has propertytype_id	
	end
	
end
