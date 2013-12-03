#Author: Krishnaveni
#======================
class Seasonallicense < ActiveRecord::Base
	belongs_to :gender

	
	#method : indexing on Seasonallicense
	define_index do
		indexes first_name
		indexes	last_name
		indexes shop_name
		indexes shop_number
	#with{}
	
	end

end
