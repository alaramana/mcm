#Author: Chaitanya
#Controller : Property Tax Calculations
#=================================================
class PtaxController < ApplicationController

	#Method:new
	def new
		@ptax = Ptax.new

		@zone = Zone.find(:all)
		@ward = Ward.find(:all)		
		@street = Street.find(:all)
		@ptaxregistration = Ptaxregistration.find(:all)
		@propertytype = Propertytype.find(:all)
		@taxcategory = Taxcategory.find(:all)
		@occupancyfactor = Occupancyfactor.find(:all)
		@structurefactor = Structurefactor.find(:all)
		@unitvalue = Unitvalue.find(:all)		
		
	end
	#End:new

	#Method:create
	def create
		
		@ptax = Ptax.new(params[:ptax])

		@ptax.created_by = 1
		@ptax.modified_by = 1


		if @ptax.save
			
			flash[:notice] = 'Property Registration successfully Created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@ptaxes = Ptax.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @ptaxes }		#Render to XML File
  format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }
		end
	end
	#End:list

	#Method:show -- show a particular entry 
	def show
		@ptax = Ptax.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @ptaxes }		#Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@ptax = Ptax.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@ptax = Ptax.find(params[:id])
		
	
		@ptax.modified_by = 1
	
		if @ptax.update_attributes(params[:ptax])
			flash[:notice] = 'Property Registration Successfully Updated.'
			redirect_to :action => 'show', :id => @ptax
		else
		@zone = Zone.find(:all)
		@ward = Ward.find(:all)		
		@street = Street.find(:all)
		@ptaxregistration = Ptaxregistration.find(:all)
		@propertytype = Propertytype.find(:all)
		@taxcategory = Taxcategory.find(:all)
		@occupancyfactor = Occupancyfactor.find(:all)
		@structurefactor = Structurefactor.find(:all)
		@unitvalue = Unitvalue.find(:all)		
		
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Ptax.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#TODO Property tax calculation - arrers and year wise


	#Method:updateinvoice -- Updates the property Tax Table with values
	def updateinvoice
		@ptax = Ptax.find(params[:id])
		@ptax.modified_by = 1
		if @ptax.update_attributes(params[:ptax])
			flash[:notice] = 'Property Tax Calculation Suceesfully done.'
			redirect_to :action => 'showinvoice', :id => @ptax
		else
		@zone = Zone.find(:all)
		@ward = Ward.find(:all)		
		@street = Street.find(:all)
		@ptaxregistration = Ptaxregistration.find(:all)
		@propertytype = Propertytype.find(:all)
		@taxcategory = Taxcategory.find(:all)
		@occupancyfactor = Occupancyfactor.find(:all)
		@structurefactor = Structurefactor.find(:all)
		@unitvalue = Unitvalue.find(:all)		
		
			render :action => 'calculate'
		end
	end
	#End:updateinvoice

	#Method: show invoce -- Show final invoice of Property Tax
	def showinvoice
		@ptax = Ptax.find(params[:id])
		@ptax.total = @ptax.invoice
		@ptax.update_attributes(params[:ptax])	
	end
	#End:showinvoice


	#method: search
	def search
		@query = params[:query]
		@ptaxs = Ptax.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search
end
