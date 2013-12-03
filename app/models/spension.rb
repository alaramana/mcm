#Author: Krishnaveni
#==============
class Spension < ActiveRecord::Base
	#Relations
	belongs_to :ssccategory
	belongs_to :gender

	#validations
    validates_presence_of :first_name
    validates_presence_of :last_name

	#method define maximum Number
	def max
		Spension.maximum(:spension_number)
	end
	#end: max

#Method: Indexing     
	define_index do
		indexes spension_number
		indexes first_name
		indexes last_name
	end
end
