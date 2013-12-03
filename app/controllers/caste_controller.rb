#Author: Chaitanya
#Controller: Caste
#-------------------

class CasteController < ApplicationController
	#Method: New
	def new
		@caste = Caste.new
		@religion = Religion.find(:all)	#Show All Religonss
	end
	#End: New

	#Method: Create
	def create
		@caste = Caste.new(params[:caste])
		@caste.created_by = 1
		@caste.modified_by = 1
		if @caste.save
			flash[:notice] = 'Caste Created Sucessfully.'
			redirect_to :action => 'list'
		else
			@religion = Religion.find(:all)
			render :action => 'new'
		end
	end  
	# End of create

	#Method: List
	def list
		@castes = Caste.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @castes }		#Render to XML File
    	end
	end
	#End: List

	#Method:Show
	def show
		@caste = Caste.find(params[:id])
    	        respond_to do |format|		
     		    format.html 
      		    format.xml  { render :xml => @castes }		#Render to XML File
    	end
	end
	#End:Show

	#Method: Edit
	def edit
		@religion = Religion.find(:all)
		@caste = Caste.find(params[:id])
	end
	#End:Caste

	#Method: Update
	def update
		@caste = Caste.find(params[:id])
		@caste.modified_by = 1

		if @caste.update_attributes(params[:caste])
			flash[:notice] = 'Caste Updated Sucessfully.'
			redirect_to :action => 'show', :id => @caste
		else
			@religion = Religion.find(:all)
			render :action => 'edit'
		end
	end
	#End: Update

	#Method:Delete
	def delete
		Caste.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete

	#method : search
	def search
		@query = params[:query]
		@castes = Caste.search @query, :page => params[:page], :per_page => 10
	end

	#method: Report Generation
	def castereport
		@castes = Caste.find(:all, :order => "name")


    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "castereport.pdf", :type => 'application/pdf')
	end
	#End:report


end
