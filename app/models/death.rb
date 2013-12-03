#Author: Chaitnaya
#model: Death Registrations
#===========================================
class Death < ActiveRecord::Base
	belongs_to :gender
	belongs_to :religion
	belongs_to :caste
	belongs_to :hospital

	validates_presence_of :first_name
	validates_presence_of :last_name	
	validates_presence_of :death_date
	validates_presence_of :father_name
	
			
	#method define maximum of Register id
	def max
		Death.maximum(:register_id)
	end
	#end: max

	#method totalamount
	def totalamount
		copies * 5
	end
	#end: max

	#Method: Indexing on Name
	define_index do
		indexes death_date
		indexes first_name
		indexes last_name
		indexes city
		indexes father_name
		indexes	death_place
		indexes gender.name
		indexes religion.name
		indexes hospital.name
		indexes register_id
	#with{}
	has gender_id,religion_id,hospital_id
	end
	#end.
end
