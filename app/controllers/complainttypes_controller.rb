#Author: Krishnaveni
#---------------------
class ComplainttypesController < ApplicationController
	#Method:new
	   def new
	      @complainttype = Complainttype.new	    
	   end
	#End:new

	#Method:create
	   def create
	      @complainttype = Complainttype.new(params[:complainttype])

	      @complainttype.created_by = 1
	      @complainttype.modified_by = 1

	    if @complainttype.save
		flash[:notice] = 'Record successfully created.'
	     	redirect_to :action => 'list'

	      else
		
		    render :action => 'new'
	    end
	    
	    end 
	 # End of create
	
	#Method:list	
	   def list
	     @complainttypes = Complainttype.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @complainttypes }	#Render to XML File
                        format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }
		end
	   end
	#End:list

	#Method:show
	 def show
	      @complainttype = Complainttype.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @complainttypes }	#Render to XML File
		end
	 end
	#End:show

	#Method:edit
	  def edit	
	      @complainttype = Complainttype.find(params[:id])	   
	  end
	#End:edit

	#Method:update
	  def update
	      @complainttype = Complainttype.find(params[:id])

	      @complainttype.created_by = 1
	      @complainttype.modified_by = 1

	      if @complainttype.update_attributes(params[:complainttype])
		 redirect_to :action => 'show', :id => @complainttype
	      else		
		 render :action => 'edit'
	      end
	   end
	#End:update

	#Method:delete
	def delete
		Complainttype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@complainttypes = Complainttype.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search
#method: Report Generation
	def complainttypereport
		@complainttypes = Complainttype.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "complainttypereport.pdf", :type => 'application/pdf')
	end
	#End:report

end
