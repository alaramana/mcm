#Author: Krishnaveni
#---------------------
class LicensetypeController < ApplicationController
	#Method:new
	   def new
	      @licensetype = Licensetype.new	    
	   end
	#End:new

	#Method:create
	   def create
	      @licensetype = Licensetype.new(params[:licensetype])

	      @licensetype.created_by = 1
	      @licensetype.modified_by = 1

	    if @licensetype.save
		flash[:notice] = 'Record successfully created.'
	     	redirect_to :action => 'list'

	      else

		    render :action => 'new'
	    end
	    
	    end 
	 # End of create
	
	#Method:list	
	   def list
	     @licensetypes = Licensetype.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @licensetypes }	#Render to XML File
		end
	   end
	#End:list

	#Method:show
	 def show
	      @licensetype = Licensetype.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @licensetypes }	#Render to XML File
		end
	 end
	#End:show

	#Method:edit
	  def edit	
	      @licensetype = Licensetype.find(params[:id])	   
	  end
	#End:edit

	#Method:update
	  def update
	      @licensetype = Licensetype.find(params[:id])

	      @licensetype.created_by = 1
	      @licensetype.modified_by = 1

	      if @licensetype.update_attributes(params[:licensetype])
		 redirect_to :action => 'show', :id => @licensetype
	      else		
		 render :action => 'edit'
	      end
	   end
	#End:update

	#Method:delete
	def delete
		Licensetype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@licensetypes = Licensetype.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search
#method: Report Generation
	def licensetypereport
		@licensetypes = Licensetype.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "licensetypereport.pdf", :type => 'application/pdf')
	end
	#End:report
end
