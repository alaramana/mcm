#Author: Krishnaveni
#======================
class Rental < ActiveRecord::Base
	belongs_to :rentaltype
	belongs_to :ward
	belongs_to :street
        validates_presence_of :rental_number
	#TODOneed to be improve and confirmation with Client	
	def invoice
		rentaltype.amount
	end

	#method : indexing on Rental
	define_index do
		indexes rental_number		
		indexes rentaltype.amount		
		
	#with{}
	has rentaltype_id
	end
end
