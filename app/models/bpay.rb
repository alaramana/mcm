#Author: Chaitanya
#model: BPay (Salary Calculation)
#============================================
class Bpay < ActiveRecord::Base
	belongs_to :salary
	has_many   :employees
	belongs_to :department
	belongs_to :designation
end
