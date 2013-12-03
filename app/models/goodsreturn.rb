#Author: Krishnaveni
#======================
class Goodsreturn < ActiveRecord::Base
	belongs_to :itemmaster

	#Method: Indexing on Goods Return
	define_index do		
		indexes return_date
		indexes amount
		indexes quantity
		indexes itemmaster.item_name
		#with{}
		has itemmaster_id
	end
end
