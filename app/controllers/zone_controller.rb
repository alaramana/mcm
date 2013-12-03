#Author :Chaitanya
#Controller: Zone
#----------
class ZoneController < ApplicationController
	#Method: Create New Zone	
	def new
		@zone = Zone.new
	end
	#End of New

	#Method: Create
	def create
		@zone = Zone.new(params[:zone])
		@zone.created_by = 1
		@zone.modified_by = 1

		if @zone.save
			flash[:notice] = 'Zone Sucessfully Created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List all
	def list
		@zones = Zone.paginate :page => params[:page], :per_page => 10	#Pagination for 10 Records
    	respond_to do |format|		
     		    format.html # list.html.erb
      			format.xml  { render :xml => @zones }		#Render to XML File

#format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }    	


end
	end
	#End Method: List

	#Method: Show
	def show
		@zone = Zone.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @zones }
    	end
	end
	#End Method: Show

	#Method: Edit
	def edit
		@zone = Zone.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update
		@zone = Zone.find(params[:id])

		@zone.modified_by = 1

		if @zone.update_attributes(params[:zone])
			flash[:notice] = 'Zone Updated Sucessfully.'
			redirect_to :action => 'show', :id => @zone
		else
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method:Delete
	def delete
		Zone.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search
		 @query = params[:query]
		 @zones = Zone.search @query, :page => params[:page], :per_page => 10
	end
	#End:search

	#method: Report Generation
	def zonereport
		@zones = Zone.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "zonereport.pdf", :type => 'application/pdf')
	end
	#End:report
end
