#Author: Chaitanya
#Controller: Connection Type (Water Tax)
#==============================================
class ConnectiontypeController < ApplicationController
	#Method: New
	def new
		@connectiontype = Connectiontype.new
	end
	#End Method: New

	#Method: New
	def create
		@connectiontype = Connectiontype.new(params[:connectiontype])
		@connectiontype.created_by = 1
		@connectiontype.modified_by = 1
		if @connectiontype.save
			flash[:notice] = 'Connection Type Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@connectiontypes = Connectiontype.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @connectiontypes }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: show
	def show
		@connectiontype = Connectiontype.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @connectiontypes }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@connectiontype = Connectiontype.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@connectiontype = Connectiontype.find(params[:id])
		@connectiontype.modified_by = 1

		if @connectiontype.update_attributes(params[:connectiontype])
			flash[:notice] = 'Connection Type Updated Sucessfully.'
			redirect_to :action => 'show', :id => @connectiontype
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Connectiontype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete
	
	#Method: search
	def search
		@query = params[:query]
		@connectiontypes = Connectiontype.search @query, :page => params[:page], :per_page => 10

	end
	#end method: search
#method: Report Generation
	def connectiontypereport
		@connectiontypes = Connectiontype.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "connectiontypereport.pdf", :type => 'application/pdf')
	end
	#End:report

	

end
