#Author: Chaitanya
#model: DA (Salary Calculation)
#========================================
class Da < ActiveRecord::Base
belongs_to :salary
belongs_to :bpay
validates_presence_of :da_amount

end
