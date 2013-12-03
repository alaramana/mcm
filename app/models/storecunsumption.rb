#Author: Krishnaveni
#======================
class Storecunsumption < ActiveRecord::Base
	belongs_to :itemmaster
	belongs_to :department
        validates_presence_of :quantity
	#Method: Indexing on Store Cunsumption
	define_index do		
		indexes quantity
		indexes itemmaster.item_name
		indexes department.name
		#with{}
		has itemmaster_id,department_id
	end
end
