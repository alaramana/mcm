#Author: Krishnaveni
#---------------------
class StorecunsumptionsController < ApplicationController
	#method: new
	def new
	@storecunsumption = Storecunsumption.new
	@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
	@department = Department.find(:all)		#Show all Departments
	end
	#End method: new

	#mthod: create
	def create
	@storecunsumption = Storecunsumption.new(params[:storecunsumption])
	@storecunsumption.created_by = 1
	@storecunsumption.modified_by = 1

		if @storecunsumption.save
		flash.now[:notice] = 'Storecunsumption successfully created.'
		redirect_to :action => 'list'
		else
		@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
		@department = Department.find(:all)		#Show all Departments
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@storecunsumptions = Storecunsumption.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @storecunsumptions }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@storecunsumption = Storecunsumption.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @storecunsumptions }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
	@department = Department.find(:all)		#Show all Departments
	@storecunsumption = Storecunsumption.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@storecunsumption = Storecunsumption.find(params[:id])

	@storecunsumption.modified_by = 1
		if @storecunsumption.update_attributes(params[:storecunsumption])
		redirect_to :action => 'show', :id => @storecunsumption
		flash.now[:notice] = 'Storecunsumption successfully created.'
		else
		@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
		@department = Department.find(:all)		#Show all Departments
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Storecunsumption.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete	

	#Method:search
	def search		
		 @query = params[:query]
		 @storecunsumptions = Storecunsumption.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search
#method: Report Generation
	def storeconsumptionreport
		@storecunsumptions = Storecunsumption.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "storeconsumptionreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
