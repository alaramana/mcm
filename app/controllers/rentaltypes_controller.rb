#Author :Krishnaveni
#---------
class RentaltypesController < ApplicationController
	#Method: Create 
	def new
		@rentaltype = Rentaltype.new
		
	end
	#End of New

	#Method: Create
	def create
		@rentaltype = Rentaltype.new(params[:rentaltype])
		@rentaltype.created_by = 1
		@rentaltype.modified_by = 1

		if @rentaltype.save
			flash[:notice] = 'rentaltype Sucessfully Created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List all
	def list
		@rentaltypes = Rentaltype.paginate :page => params[:page], :per_page => 10	#Pagination for 10 Records
    	respond_to do |format|		
     		    format.html # list.html.erb
      			format.xml  { render :xml => @rentaltypes }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: Show
	def show
		@rentaltype = Rentaltype.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @rentaltypes }
    	end
		
	end
	#End Method: Show

	#Method: Edit
	def edit
		@rentaltype = Rentaltype.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update
		@rentaltype = Rentaltype.find(params[:id])

		@rentaltype.modified_by = 1

		if @rentaltype.update_attributes(params[:rentaltype])
			flash[:notice] = 'rentaltype Updated Sucessfully.'
			redirect_to :action => 'show', :id => @rentaltype
		else
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method:Delete
	def delete
		Rentaltype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search
		 @query = params[:query]
		 @rentaltypes = Rentaltype.search @query, :page => params[:page], :per_page => 10
	end
	#End:search

#method: Report Generation
	def rentaltypereport
		@rentaltypes = Rentaltype.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "rentaltypereport.pdf", :type => 'application/pdf')
	end
	#End:report
end
