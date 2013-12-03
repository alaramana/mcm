#Author :Krishnaveni
#Controller: Rationcard Types
#----------
class RationcardtypesController < ApplicationController
	#Method: Create	
	def new
		@rationcardtype = Rationcardtype.new
		
	end
	#End of New

	#Method: Create
	def create
		@rationcardtype = Rationcardtype.new(params[:rationcardtype])
		@rationcardtype.created_by = 1
		@rationcardtype.modified_by = 1

		if @rationcardtype.save
			flash[:notice] = 'rationcardtype Sucessfully Created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List all
	def list
		@rationcardtypes = Rationcardtype.paginate :page => params[:page], :per_page => 10	#Pagination for 10 Records
    	respond_to do |format|		
     		    format.html # list.html.erb
      			format.xml  { render :xml => @rationcardtypes }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: Show
	def show
		@rationcardtype = Rationcardtype.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @rationcardtypes }
    	end
		
	end
	#End Method: Show

	#Method: Edit
	def edit
		@rationcardtype = Rationcardtype.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update
		@rationcardtype = Rationcardtype.find(params[:id])

		@rationcardtype.modified_by = 1

		if @rationcardtype.update_attributes(params[:rationcardtype])
			flash[:notice] = 'rationcardtype Updated Sucessfully.'
			redirect_to :action => 'show', :id => @rationcardtype
		else
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method:Delete
	def delete
		Rationcardtype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search
		 @query = params[:query]
		 @rationcardtypes = Rationcardtype.search @query, :page => params[:page], :per_page => 10
	end
	#End:search
#method: Report Generation
	def rationcardreport
		@rationcardtypes = Rationcardtype.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "rationcardtrypereport.pdf", :type => 'application/pdf')
	end
	#End:report
end
