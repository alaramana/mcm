#Author: Chaitanya
#model: Property Tax Payment
#==============================================
class Ptaxpayment < ActiveRecord::Base
	belongs_to :ptax		#Property Tax invoice (Calculation)


	#Method: Indexing on Property Tax Payment
	define_index do		
		indexes total_amount
		indexes paid_amount
		indexes paymentmode
		indexes bank_name
		indexes cheque_number
		
	#with{}
		
	end	
end
