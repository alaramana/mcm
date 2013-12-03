#Ramana
#---------------------
class BillpaysController < ApplicationController
	#method: new
	def new
	@billpay = Billpay.new
	end
	#End method: new

	#mthod: create
	def create
	@billpay = Billpay.new(params[:billpay])
	@billpay.created_by = 1
	@billpay.modified_by = 1

		if @billpay.save
		flash.now[:notice] = 'Billpay successfully created.'
		redirect_to :action => 'list'
		else
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@billpays = Billpay.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @billpays }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@billpay = Billpay.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @billpays }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@billpay = Billpay.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@billpay = Billpay.find(params[:id])

	@billpay.modified_by = 1
		if @billpay.update_attributes(params[:billpay])
		redirect_to :action => 'show', :id => @billpay
		flash.now[:notice] = 'Billpay successfully created.'
		else
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Billpay.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete	

	#Method:search
	def search		
		 @query = params[:query]
		 @billpays = Billpay.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search	
#method: Report Generation
	def billpaysreport
		@billpays = Billpay.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "billpaysreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
