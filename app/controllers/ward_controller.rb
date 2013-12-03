#Author: Chaitanya
#Controller: Ward Details
#==============================
class WardController < ApplicationController
	#Method: New
	def new
		@ward = Ward.new
		@zone = Zone.find(:all)		#Show all zones
	end
	#End of Method: New

	#Method: Create
	def create
		@ward = Ward.new(params[:ward])

		@ward.created_by = 1
		@ward.modified_by = 1
	
		if @ward.save
			flash[:notice] = 'Ward Created Sucessfully.'
			redirect_to :action => 'list'
		else
			@zone = Zone.find(:all)		#Show all zones
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List
	def list
		@wards = Ward.paginate :page => params[:page], :per_page => 10	#Paginatin of 10 Records
		respond_to do |format|
	 		    format.html # list.html.erb
	  			format.xml  { render :xml => @wards }	#Render to XML Files
		end
	end
	#End Method: List

	#Method: Show
	def show
		@ward = Ward.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @wards }	#Render to XML File
    	end
	end
	#End Method:Show

	#Method: Edit
	def edit
		@ward = Ward.find(params[:id])
		@zone = Zone.find(:all)		#Show all Zones
	end
	#End Method:Edit

	#Method: Update
	def update
		@ward = Ward.find(params[:id])

		@ward.modified_by = 1

		if @ward.update_attributes(params[:ward])
			flash[:notice] = 'Ward Updated Sucessfully.'
			redirect_to :action => 'show', :id => @ward
		else
		@zone = Zone.find(:all)		#Show all zones
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method: Delete
	def delete
		Ward.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete

	#Method:search
	def search		
		 @query = params[:query]
		 @wards = Ward.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search

	#method: Report Generation
	def wardreport
		@wards = Ward.find(:all)


    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "wardreport.pdf", :type => 'application/pdf')
	end
	#End:report


end
