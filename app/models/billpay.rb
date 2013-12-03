#Author: Krishnaveni
#========================
class Billpay < ActiveRecord::Base

	#Method: Indexing on BillPay
	define_index do
		indexes invoice_number
		indexes date
		indexes amount
		indexes payed_amount

		#with{}
		
	end
end
