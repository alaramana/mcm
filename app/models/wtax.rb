#Author: Chaitanya
#Model: Water Tax
#==========
class Wtax < ActiveRecord::Base	
	belongs_to :connectiontype
	validates_presence_of :wtax_number

#Method: invoice -- Calculate Water Tax
def invoice #TODO need to be improve and confirmation with Client
	connectiontype.amount
end
#End:invoice

	#Method: Indexing on Water Tax
	define_index do
		indexes :wtax_number
		indexes connectiontype.amount		
	

	#with{}
		has connectiontype_id
	end
end
