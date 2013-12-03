#Author: chaitanya
#model: Loan Account (Salary Calculation)
#====================================================
class Loanaccount < ActiveRecord::Base
	belongs_to :employee
	belongs_to :salary

#method : indexing on License
	define_index do
		indexes loanaccountno
	end
end
