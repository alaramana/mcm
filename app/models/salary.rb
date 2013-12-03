#Author: Chaitanya
#model: Salary
#===============================================
class Salary < ActiveRecord::Base
	has_many  :hras
	has_many  :das
	has_many  :tas
	has_many  :bpays
	has_many  :employees
	has_many  :loanaccounts
	
end
