#Author :Krishnaveni
#Controller: Rationcard Registration
#----------
class RationcardsController < ApplicationController
	#Method: Create 	
	def new
		@rationcard = Rationcard.new
		@rationcardtype = Rationcardtype.find(:all)#Show all Rationcardtypes
		@gender = Gender.find(:all)
	end
	#End of New

	#Method: Create
	def create
		@rationcard = Rationcard.new(params[:rationcard])
		@rationcard.created_by = 1
		@rationcard.modified_by = 1

		if @rationcard.save
			flash[:notice] = 'rationcard Sucessfully Created.'
			redirect_to :action => 'list'
		else
			@rationcardtype = Rationcardtype.find(:all)#Show all Rationcardtypes
			@gender = Gender.find(:all)
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List all
	def list
		@rationcards = Rationcard.paginate :page => params[:page], :per_page => 10	#Pagination for 10 Records
    	respond_to do |format|		
     		    format.html # list.html.erb
      			format.xml  { render :xml => @rationcards }#Render to XML File
    	end
	end
	#End Method: List

	#Method: Show
	def show
		@rationcard = Rationcard.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @rationcards }
    	end
		
	end
	#End Method: Show

	#Method: Edit
	def edit
		@rationcardtype = Rationcardtype.find(:all)#Show all Rationcardtypes
		@gender = Gender.find(:all)
		@rationcard = Rationcard.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update
		@rationcard = Rationcard.find(params[:id])

		@rationcard.modified_by = 1

		if @rationcard.update_attributes(params[:rationcard])
			flash[:notice] = 'rationcard Updated Sucessfully.'
			redirect_to :action => 'show', :id => @rationcard
		else
			@rationcardtype = Rationcardtype.find(:all)#Show all Rationcardtypes
			@gender = Gender.find(:all)
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method:Delete
	def delete
		Rationcard.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search
		 @query = params[:query]
		 @rationcards = Rationcard.search @query, :page => params[:page], :per_page => 10
	end
	#End:search

#method: Report Generation
	def rationcardreport
		@rationcards = Rationcard.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "rationcardreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
