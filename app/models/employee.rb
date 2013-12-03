#Author: Chaitanya
#=========================

class Employee < ActiveRecord::Base

#employee relations
	belongs_to :gender
	belongs_to :religion
	belongs_to :caste
	belongs_to :shift
	belongs_to :workplace
	belongs_to :department
	belongs_to :designation
	belongs_to :designationgroup
#	belongs_to :designationgroupmaster
	belongs_to :bank
	belongs_to :marital
	belongs_to :employeetype
	belongs_to :employeecategory

#employee hrm	
	belongs_to :ta
	belongs_to :da
	belongs_to :hra
	belongs_to :salary
	has_many   :loanaccounts

#Validationss
	validates_presence_of :name
	validates_presence_of :father_name
	validates_presence_of :education
	validates_presence_of :address
	validates_presence_of :phone
	validates_presence_of :mobile
	validates_presence_of :email
	validates_presence_of :nationality
	validates_presence_of :pf_number
	validates_presence_of :bank_account_number
	validates_presence_of :photo

#	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	#method : indexing on employee
	define_index do
		indexes employment_id
		indexes name
		indexes email
		indexes pan
		indexes pf_number
		indexes bank_account_number
		indexes mobile		
		indexes employeetype.name
	#with{}
		indexes employeetype_id
	end
	#end: indexing
	
	#method define maximum of Register id
	def max
		Employee.maximum(:employment_id)
	end
	#end: max
end
