#Author: Chaitanya
#Model: Property Tax Calculation
#=============================================
class Ptax < ActiveRecord::Base

        belongs_to :unitvalue	
	belongs_to :structurefactor
	belongs_to :occupancyfactor	
	belongs_to :tax						#Surcharge
	belongs_to :ptaxregistration		#Property Tax Registration
	belongs_to :taxcategory	
	has_many   :ptaxpayments			#Property Tax Payments



	#Method to Calculate the Property Tax using factors
	def invoice  #TODO need to improve with arrers and extra floors
		(((unitvalue.amount )/100 *structurefactor.factor* occupancyfactor.factor ) * build_area)
	end


	#Method: Indexing on Property Tax 
	define_index do		
		indexes start_year
		indexes end_year
		indexes total_area
		indexes build_area
		indexes assessment_number		
		indexes taxcategory.category
		indexes ptaxregistration.number
		indexes structurefactor.name
		indexes occupancyfactor.name
		indexes unitvalue.amount

	#with{}
		has ptaxregistration_id,taxcategory_id,structurefactor_id,occupancyfactor_id,unitvalue_id
	end	
end
