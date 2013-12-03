class BirthController < ApplicationController

def index
    @births = Birth.find(:all)
     respond_to do |format|
  	    format.xml { render :text => @births.to_xml }
  	    format.pdf  { render :collection => @births }
  	    format.html #default
    end
  end


#Method:New
	def new
		@birth    = Birth.new	
		@religion = Religion.find(:all)	#List all Religions
		@gender   = Gender.find(:all) 		#List all Genders
		@hospital = Hospital.find(:all)	#List all Hospitals	
		@caste    = Caste.find(:all) 	#List all Castes
		@deliverymethod = Deliverymethod.find(:all)	#List all Delviery Methods
	end
	#End: New

	#Method: Create
	def create
		@birth = Birth.new(params[:birth])
		@birth.created_by = 1
		@birth.modified_by = 1

		if @birth.save
			flash.now[:notice] = 'Birth Record successfully created.'
			redirect_to :action => 'created', :id => @birth
		else
			@religion = Religion.find(:all)
			@gender = Gender.find(:all)
			@hospital = Hospital.find(:all)
			@deliverymethod = Deliverymethod.find(:all)	
			@caste = Caste.find(:all)
			render :action => 'new'
	end
	end  
	#End:Create

	#Method:created
	def created
		@birth = Birth.find(params[:id])
		@birth.amount = @birth.totalamount
		
		@birth.update_attributes(params[:birth])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @births }		#Render to XML File
    	end
	end
	#End: created

	#Method: List
	def list
		@births = Birth.find(:all,:order => "register_id")
		#@births = Birth.paginate :page => params[:page], :per_page => 10 #Pagniation
    	respond_to do |format|		
     		    format.html 
      			format.xml { head :ok }
    	end
	end
	#End: Lsit

	#Method:Show
	def show
		@birth = Birth.find(params[:id])
    	respond_to do |format|		
     		format.html 
      		format.xml  { render :xml => @births }	#Render to XML File      
                
    	end
	end
	#End: Show

	#Method: Edit
	def edit
		@religion = Religion.find(:all)
		@gender = Gender.find(:all) 	
		@hospital = Hospital.find(:all)	
		@deliverymethod = Deliverymethod.find(:all)
		@caste = Caste.find(:all)
		@birth = Birth.find(params[:id])
	end
	#Method: Edit

	#Method:Update
	def update
		@birth = Birth.find(params[:id])
	
		@birth.modified_by = 1
		
		if @birth.update_attributes(params[:birth])
			flash.now[:notice] = 'Birth Record successfully Updated.'
			redirect_to :action => 'show', :id => @birth
		else
			@religion = Religion.find(:all)
			@gender = Gender.find(:all)
			@hospital = Hospital.find(:all)
			@deliverymethod = Deliverymethod.find(:all)	
			@caste = Caste.find(:all)
			render :action => 'edit'
		end
	end
	#End: Update

	#Method: Approve- Which Approve after Verificatin for Certificate
	def approve    
		@birth = Birth.find(params[:id])
		@birth.approved = 1
		#@birth.approved_on = Time.now.strftime
	
		if @birth.update_attributes(params[:birth])
			flash[:notice] = 'Birth Record successfully approved.'
			redirect_to :action => 'list'
		else
			render :action => 'show'
		end
	end
	#End: Approve

	#Method: Approve Ok -- List all Approved 
	def approved
		@approves = Birth.find(:all, :conditions => "approved = 1",:order => "register_id")
    	respond_to do |format|		
     		    format.html 
      	            format.xml  { render :xml => @approves }		#Render to XML File
    	end
		
	end
	#End: Approve Ok

	#Method: Not approved -- List all Not Approved Records
	def notapproved
		@notapproves = Birth.find(:all, :conditions => "approved = 0",:order => "register_id")
    	respond_to do |format|		
     		    format.html 
      		    format.xml  { render :xml => @notapproves }		#Render to XML File
    	end
	end
	#End: Not Approved
	#Method: search
	def search
		@query = params[:query]
		@births = Birth.search @query, :page => params[:page], :per_page => 10		
	end
	#End of search Method

	#method: Report Generation
	def birthreport
		@births = Birth.find(:all, :order =>"register_id")
   		html = render :layout => false 
		kit = PDFKit.new(html,:orientation => 'Landscape')

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "birthreport.pdf", :type => 'application/pdf')
	end
	#End:report

	#method: Report Generation
	def printcertificate
		@birth = Birth.find(params[:id])
   		html = render :layout => false 
		kit = PDFKit.new(html)

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "birthcertificate.pdf", :type => 'application/pdf')
	end
	#End:report


end
