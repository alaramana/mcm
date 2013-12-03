#Author: Krishnaveni
#========================
class Billpassing < ActiveRecord::Base
         validates_presence_of :invoice_number
	#Method: Indexing on Bill Passing
	define_index do
		indexes invoice_number
		indexes invoice_date
		indexes amount		
		indexes org_name

		#with{}
		
	end
end
