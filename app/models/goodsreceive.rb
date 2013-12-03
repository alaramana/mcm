#Author: Krishnaveni
#======================
class Goodsreceive < ActiveRecord::Base
	belongs_to :itemmaster
        validates_presence_of :received_date
	#Method: Indexing on Goods Receive
	define_index do		
		indexes received_date
		indexes amount
		indexes quantity
		indexes itemmaster.item_name
		#with{}
		has itemmaster_id
	end
end
