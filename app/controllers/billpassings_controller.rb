#Author: Krishnaveni
#---------------------
class BillpassingsController < ApplicationController
	#method: new
	def new
	@billpassing = Billpassing.new
	end
	#End method: new

	#mthod: create
	def create
	@billpassing = Billpassing.new(params[:billpassing])
	@billpassing.created_by = 1
	@billpassing.modified_by = 1

		if @billpassing.save
		flash.now[:notice] = 'Billpassing successfully created.'
		redirect_to :action => 'list'
		else
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@billpassings = Billpassing.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @billpassings }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@billpassing = Billpassing.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @billpassings }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@billpassing = Billpassing.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@billpassing = Billpassing.find(params[:id])

	@billpassing.modified_by = 1
		if @billpassing.update_attributes(params[:billpassing])
		redirect_to :action => 'show', :id => @billpassing
		flash.now[:notice] = 'Billpassing successfully created.'
		else
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Billpassing.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete	
	
	#Method:search
	def search		
		 @query = params[:query]
		 @billpassings = Billpassing.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search	
#method: Report Generation
	def billpassingreport
		@billpassings = Billpassing.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "billpassingreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
