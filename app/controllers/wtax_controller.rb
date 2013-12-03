#Author: Chaitanya
#Controller: Water Tax 
#=====================
class WtaxController < ApplicationController

	#Method:new
	def new
		@wtax = Wtax.new				
		@connectiontype = Connectiontype.find(:all)	#List of all connection types
	end
	#End:new

	#Method:create
	def create
		@wtax = Wtax.new(params[:wtax])
		@wtax.created_by = 1
		@wtax.modified_by = 1

		if @wtax.save
			flash[:notice] = 'Water Tax Record successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End:create

	#Method:list
	def list
		@ptaxregistrations = Ptaxregistration.find(:all , :conditions => "waterconnection = 1 ").paginate :page => params[:page], :per_page => 10
		respond_to do |format|
			format.html 
			format.xml  { render :xml => @wtaxes } #Render to XML 
       	end
	end
	#End:list

	#Method:show
	def show
		@ptaxregistration = Ptaxregistration.find(params[:id])
		respond_to do |format|
			format.html 
			format.xml  { render :xml => @wtaxes } #Render to XML 
		end
	end
	#End:show

	#Method:edit
	def edit
		@wtax = Wtax.find(params[:id])		
		@connectiontype = Connectiontype.find(:all)
	end  
	#End:edit

	#Method:update
	def update
		@wtax = Wtax.find(params[:id])

		@wtax.modified_by = 1

		if @wtax.update_attributes(params[:wtax])
			flash[:notice] = 'Water Tax Record successfully Updated.'
			redirect_to :action => 'show', :id => @wtax
		else
			@connectiontype = Connectiontype.find(:all)
			render :action => 'edit'
		end
	end  
	#End:update

	#Method:delete
	def delete
		Wtax.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#Method:calculate --- Method calculate the water tax (model Wtax)
	def calculate
	#TODO Need to improve more with arrers
		@ptaxregistration = Ptaxregistration.find(params[:id])
	end
	#End:create

	#Method:updateinvoice -- Which update the table with Water tax 
	def updateinvoice
		@ptaxregistration = Ptaxregistration.find(params[:id])
		@wtax.modified_by = 1
		if @wtax.update_attributes(params[:ptaxregistration])
			flash[:notice] = 'Water Tax Record successfully Updated.'
			redirect_to :action => 'showinvoice', :id => @ptaxregistration
		else
			render :action => 'calculate'
		end
	end 
	#End:updateinvoice

	#Method:showinvoice -- Which show generated invoice
	def showinvoice
		@wtax = Wtax.find(params[:id])		
		@wtax.update_attributes(params[:wtax])
	end
	#End:showinvoice

	#Method:search
	def search
		 @query = params[:query]
		 @wtaxes = Wtax.search @query, :page => params[:page], :per_page => 10
	end
	#End:search
end
