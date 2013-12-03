#Author :Krishnaveni
#---------
class RentalsController < ApplicationController
	#Method: Create
	def new
		@rental = Rental.new
		@rentaltypes = Rentaltype.find(:all)#Show all Rentaltype
		@wards = Ward.find(:all)
		@streets = Street.find(:all)
	end
	#End of New

	#Method: Create
	def create
		@rental = Rental.new(params[:rental])
		@rental.created_by = 1
		@rental.modified_by = 1

		if @rental.save
			flash[:notice] = 'rental Sucessfully Created.'
			redirect_to :action => 'list'
		else
			@rentaltypes = Rentaltype.find(:all)#Show all Rentaltype
			@wards = Ward.find(:all)
			@streets = Street.find(:all)
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List all
	def list
		@rentals = Rental.paginate :page => params[:page], :per_page => 10	#Pagination for 10 Records
    	respond_to do |format|		
     		    format.html # list.html.erb
      			format.xml  { render :xml => @rentals }#Render to XML File
    	end
	end
	#End Method: List

	#Method: Show
	def show
		@rental = Rental.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @rentals }
    	end
		
	end
	#End Method: Show

	#Method: Edit
	def edit
		@rentaltypes = Rentaltype.find(:all)#Show all Rentaltypes
		@wards = Ward.find(:all)
		@streets = Street.find(:all)
		@rental = Rental.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update
		@rental = Rental.find(params[:id])
		@rental.modified_by = 1

		if @rental.update_attributes(params[:rental])
			flash[:notice] = 'rental Updated Sucessfully.'
			redirect_to :action => 'show', :id => @rental
		else
			@rentaltypes = Rentaltype.find(:all)#Show all Rentaltypes
			@wards = Ward.find(:all)
			@streets = Street.find(:all)
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method:calculate --- Method calculate the Rental tax (model Rental)
	def calculate		
		@rentaltypes = Rentaltype.find(:all)#Show all Rentaltypes
		@wards = Ward.find(:all)
		@streets = Street.find(:all)
		 @rental = Rental.find(params[:id])
	end
	#End:create

	#Method:updateinvoice -- Which update the table with Rental
	def updateinvoice
		 @rental = Rental.find(params[:id])	    	
	     	 @rental.modified_by = 1

		if @rental.update_attributes(params[:rental])
			flash[:notice] = 'Rental Amount Record successfully Updated.'
			redirect_to :action => 'showinvoice', :id => @rental
		else
			render :action => 'calculate'
		end
	end 
	#End:updateinvoice

	#Method:showinvoice -- Which show generated invoice
	def showinvoice
		@rental = Rental.find(params[:id])		
		@rental.update_attributes(params[:rental])
	end
	#End:showinvoice



	#Method:Delete
	def delete
		Rental.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search
		 @query = params[:query]
		 @rentals = Rental.search @query, :page => params[:page], :per_page => 10
	end
	#End:search

#method: Report Generation
	def rentalreport
		@rentals = Rental.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "rentalreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
