#Author: Chaitanya
#Controller: Property Tax Registrations
#=============================================================
class PtaxregistrationController < ApplicationController

	#Method:autocomplete
	auto_complete_for :ptaxregistration,:number

	#Method:new
	def new
		@ptaxregistration = Ptaxregistration.new


		@zone = Zone.find(:all)
		@ward = Ward.find(:all)		
		@street = Street.find(:all)
		@connection = Connectiontype.find(:all)
	end
	#End:new

	#Method:create
	def create
		@ptaxregistration = Ptaxregistration.new(params[:ptaxregistration])

		@ptaxregistration.created_by = 1
		@ptaxregistration.modified_by = 1
	

		if @ptaxregistration.save
			flash[:notice] = 'Property Registration successfully Created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@ptaxregistrations = Ptaxregistration.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @ptaxregistrations }		#Render to XML File
		end
	end
	#End:list

	#Method:show -- show a particular entry 
	def show
		@ptaxregistration = Ptaxregistration.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @ptaxregistrations }		#Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@ptaxregistration = Ptaxregistration.find(params[:id])
		@zone = Zone.find(:all)
		@ward = Ward.find(:all)
		@street = Street.find(:all)
		@connection = Connectiontype.find(:all)

	end
	#End:edit

	#Method:update
	def update
		@ptaxregistration = Ptaxregistration.find(params[:id])
		
		@ptaxregistration.modified_by = 1
	
		if @ptaxregistration.update_attributes(params[:ptaxregistration])
			flash[:notice] = 'Property Registration Successfully Updated.'
			redirect_to :action => 'show', :id => @ptaxregistration
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Ptaxregistration.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@ptaxregistrations = Ptaxregistration.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

end

