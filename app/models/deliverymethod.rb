#Author: Chaitanya
#---------------
class Deliverymethod < ActiveRecord::Base
	has_many :births

	validates_presence_of :name

	#method : indexing on delivery method name
	define_index do
		indexes :name

	end
end
