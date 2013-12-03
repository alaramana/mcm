#Author: Chaitanya
#=====================
class Structurefactor < ActiveRecord::Base
	has_many :registrations

	validates_presence_of :name
	validates_presence_of :factor
		
	 #Method: Indexing on Structurefactor
	define_index do
		indexes :name
		#with{}	
	end
	has_many :ptaxes
end
