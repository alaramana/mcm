#Author: chaitanya
#Controller: Death Registrations
#------------------

class DeathController < ApplicationController

	#Method: New
	def new
		@death = Death.new
		@religions = Religion.find(:all)	
		@genders = Gender.find(:all) 	
		@hospitals = Hospital.find(:all)	
	    @castes = Caste.find(:all)
	end
	#End Method: New

	#Method: New
	def create
		@death = Death.new(params[:death])
		@death.created_by = 1
		@death.modified_by = 1
		
		if @death.save
			flash.now[:notice] = 'Death Registration successfully created.'
			redirect_to :action => 'created', :id => @death
		else
			@religions = Religion.find(:all)
			@genders = Gender.find(:all) 	
			@hospitals = Hospital.find(:all)	
		    @castes = Caste.find(:all)

			render :action => 'new'
		end
	end  
	# End of create
	
		#Method:created
	def created
		@death = Death.find(params[:id])
		@death.amount = @death.totalamount
		
		@death.update_attributes(params[:death])
    	respond_to do |format|		
     		    format.html 
      		    format.xml  { render :xml => @deaths }		#Render to XML File
    	end
	end
	#End: created


	#Method: list
	def list
		@deaths = Death.paginate :page => params[:page], :per_page => 10	#Pagination
   		respond_to do |format|		
     		    format.html 
      		    format.xml  { render :xml => @deaths }		#Render to XML File
    	end
		
	end
	#End Method: list

	#Method: show
	def show
		@death = Death.find(params[:id])
  		respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @deaths }	#Render to XML File
    	end
		
	end
	#End Method: show

	#Method: edit
	def edit
		@religions = Religion.find(:all)
		@genders = Gender.find(:all) 	
		@hospitals = Hospital.find(:all)	
	    @castes = Caste.find(:all)

		@death = Death.find(params[:id])
	end
	#End Method: ediy

	#Method: New
	def update
		@death = Death.find(params[:id])
		@death.modified_by = 1

		if @death.update_attributes(params[:death])
			flash.now[:notice] = 'Death Registration successfully Updated.'
			redirect_to :action => 'show', :id => @death
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def approve    
		@death = Death.find(params[:id])
		@death.approved = 1
		#   @death.approved_on = Time.now.strftime
		if @death.update_attributes(params[:death])
			flash[:notice] = 'Death Record successfully Approved.'
			redirect_to :action => 'list'
		else
			render :action => 'show'
		end
	end
	#End Method: update

	#Method: Approved - List all Records those approved
	def approved
		@approves = Death.find(:all, :conditions => "approved = 1")
	end
	#End Method: approved

	#Method: Not Approved -- List all Records of Not Approved
	def notapproved
		@not_approves = Death.find(:all, :conditions => "approved = 0")
	end
	#End Method: not approved
	#Method: search
	def search
		@query = params[:query]
		@deaths = Death.search @query, :page => params[:page], :per_page => 10		

	end

	#End of search Method


	#method: Report Generation
	def reportall
		@deaths = Death.find(:all, :order =>"register_id")
   		html = render :layout => false 
		kit = PDFKit.new(html)

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "deathreport.pdf", :type => 'application/pdf')
	end
	#End:report

	#method: Report Generation
	def printcertificate
		@death = Death.find(params[:id])
   		html = render :layout => false 
		kit = PDFKit.new(html)

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "deathcertificate.pdf", :type => 'application/pdf')
	end
	#End:report

	#method: Report Generation
	def deathreport
		@deaths = Death.find(:all)
   		html = render :layout => false 
		kit = PDFKit.new(html,:orientation => 'Landscape')

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "deathreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
