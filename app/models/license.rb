#Author: Krishnaveni
#======================
class License < ActiveRecord::Base	
	belongs_to :licensetype
	belongs_to :ward
	belongs_to :street

	#TODOneed to be improve and confirmation with Client	
	def invoice
		licensetype.amount
	end

	#method : indexing on License
	define_index do
		indexes license_number		
		indexes licensetype.amount		
		
	#with{}
	has licensetype_id
	end
end
