#Author: Krishnaveni
#Refine: Chaitanya
#Controller: Street
#-----------------
class StreetController < ApplicationController

	#Method: New
	def new
		@street = Street.new
		@ward = Ward.find(:all)			
	end
	#End Method: New

	#Method: Create
	def create
		@street = Street.new(params[:street])

		@street.created_by = 1
		@street.modified_by = 1

		if @street.save
			flash[:notice] = 'Street Created Sucessfully.'
			redirect_to :action => 'list'
		else
			@ward = Ward.find(:all)			
			render :action => 'new'
		end
	end  
	# End Method: Crate

	#Method: List
	def list
		@streets = Street.paginate :page => params[:page], :per_page => 10	#pagination
    	respond_to do |format|
    		    format.html # show.html.erb
      			format.xml  { render :xml => @streets }	#Render XML Files
    	end

	end
	#End Method: List

	#Method: Show
	def show
		@street = Street.find(params[:id])
		respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @streets }		#Render XML File
    	end

	end
	#End of Method: Show

	#Method: Edit
	def edit
		@ward = Ward.find(:all)			
		@street = Street.find(params[:id])		
	end
	#End of Method: Edit

	#Method: Update
	def update
		@street = Street.find(params[:id])
	
		@street.modified_by = 1

		if @street.update_attributes(params[:street])
			flash[:notice] = 'Street Updated Sucessfully.'
			redirect_to :action => 'show', :id => @street
		else
			@ward = Ward.find(:all)			
			render :action => 'edit'
		end
	end
	#End of Method: Update

	#Method: Delete
	def delete
		Street.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End of Method: Delete

	#Method:search
	def search		
		 @query = params[:query]
		 @streets = Street.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search

	#method: Report Generation
	def streetreport
		@streets = Street.find(:all)


    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "streetreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
