#Author: Chaitanya
#model: HRA (Salary Calculations)
#===========================================
class Hra < ActiveRecord::Base
	belongs_to :salary
validates_presence_of :hra_amount
end
