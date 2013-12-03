#Author :Krishnaveni
#==========
class Rationcardtype < ActiveRecord::Base
	has_many :rationcards
        validates_presence_of :card_type
	#Method: Indexing on Name
	define_index do
		indexes :card_type

	#with{}
	end
end
