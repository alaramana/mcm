#Author: Krishnaveni
#======================
class Itemmaster < ActiveRecord::Base
	belongs_to :itemcategory
	has_many :goodsreturns
	has_many :goodsreceives

	 #Method: Indexing on item Master name
	define_index do
		indexes item_name
		indexes quantity
		indexes itemcategory.category_name

		#with{}
		has itemcategory_id
	end
end
