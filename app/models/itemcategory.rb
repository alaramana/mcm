#Author: Krishnaveni
#======================
class Itemcategory < ActiveRecord::Base
	has_many :itemmasters


	#Method: Indexing on item Category name
	define_index do
		indexes category_name
		

		#with{}
		
	end
end
