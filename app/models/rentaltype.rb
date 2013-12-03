#Author: Krishnaveni
#======================
class Rentaltype < ActiveRecord::Base
	  has_many :rentals
          validates_presence_of :rental_type

	#method : indexing on RentalType
	define_index do
		indexes rental_type	
		

	#with{}
	
	end
end
