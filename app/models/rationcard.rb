#Author :Krishnaveni
#==========
class Rationcard < ActiveRecord::Base
	belongs_to :rationcardtype
	belongs_to :gender
	#Method: Indexing on Name
	define_index do		
		indexes rationcard_number
		indexes owner_birth_date
		indexes card_reg_date
		indexes owner_name
		indexes rationcardtype.card_type

	#with{}
		has rationcardtype_id
	end
end
