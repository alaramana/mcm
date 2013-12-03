class Birth < ActiveRecord::Base
	#relations
	belongs_to :gender
	belongs_to :religion
	belongs_to :hospital
	belongs_to :deliverymethod
	belongs_to :caste

	#validations	
	validates_presence_of :father_name
	validates_presence_of :mother_name

	#method define maximum of Register id
	def max
		Birth.maximum(:register_id)
	end
	#end: max

	#method totalamount
	def totalamount
		copies * 5
	end
	#end: max
	
	#Method: Indexing on Name
	define_index do
		indexes birth_date
		indexes first_name
		indexes last_name
		indexes city
		indexes	birth_place
		indexes father_name
		indexes mother_name
		indexes tehsil
		indexes gender.name
		indexes religion.name
		indexes hospital.name
		indexes caste.name
		indexes register_id
		

	#with{}
		has gender_id,religion_id,hospital_id,caste_id
	end

end
