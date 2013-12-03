#Author: Krishnaevni
#=========================
class Marriage < ActiveRecord::Base

	#method define maximum of Register id
	def max
		Marriage.maximum(:marriage_reg_number)
	end
	#end: max
	
	#validations
	validates_presence_of :groom_name
	validates_presence_of :bride_name
	validates_presence_of :bride_father
	validates_presence_of :groom_father
	validates_presence_of :bride_mother	
	validates_presence_of :groom_mother



	#method : indexing on Marriage Registration
	define_index do
		indexes marriage_reg_number
		indexes groom_name
		indexes groom_father
		indexes groom_mother
		indexes groom_birth_date
		indexes bride_name
		indexes bride_father
		indexes bride_mother
		indexes bride_birth_date
		indexes marriage_date
		indexes marriage_place
	#with{}
	end
end
