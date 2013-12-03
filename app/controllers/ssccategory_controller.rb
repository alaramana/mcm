#Author: Krishnaveni
#==============
class SsccategoryController < ApplicationController
#Method: Create New Zone	
	def new
		@ssccategory = Ssccategory.new
	end
	#End of New

	#Method: Create
	def create
		@ssccategory = Ssccategory.new(params[:ssccategory])
		@ssccategory.created_by = 1
		@ssccategory.modified_by = 1

		if @ssccategory.save
			flash[:notice] = 'Ssccategory Sucessfully Created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List all
	def list
		@ssccategories = Ssccategory.paginate :page => params[:page], :per_page => 10	#Pagination for 10 Records
    	respond_to do |format|		
     		    format.html # list.html.erb
      			format.xml  { render :xml => @ssccategories }	#Render to XML File
    	end
	end
	#End Method: List

	#Method: Show
	def show
		@ssccategory = Ssccategory.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @ssccategories }
    	end
		
	end
	#End Method: Show

	#Method: Edit
	def edit
		@ssccategory = Ssccategory.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update
		@ssccategory = Ssccategory.find(params[:id])

		@ssccategory.modified_by = 1

		if @ssccategory.update_attributes(params[:ssccategory])
			flash[:notice] = 'Ssccategory Updated Sucessfully.'
			redirect_to :action => 'show', :id => @ssccategory
		else
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method:Delete
	def delete
		Ssccategory.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search
		 @query = params[:query]
		 @ssccategories = Ssccategory.search @query, :page => params[:page], :per_page => 10
	end
	#End:search

#method: Report Generation
	def ssccategoryreport
		@ssccategories = Ssccategory.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "socialcategoryreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
