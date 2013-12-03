#Author: Krishnaveni
#---------------------
class Complaint < ActiveRecord::Base
 	belongs_to :complainttype
	belongs_to :department
        validates_presence_of :complaint_number

	  #Method: Indexing on Complaint Numaber
	define_index do
		indexes :complaint_number
		indexes complainttype.complaint_type
		indexes department.name

	#with{}
		has complainttype_id,department_id
	end
	
end
