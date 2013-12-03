#Author: Krishnaveni
#======================
class Complainttype < ActiveRecord::Base

	has_many :complaints
end
