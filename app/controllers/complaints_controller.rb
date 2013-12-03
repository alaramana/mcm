#Author: Krishnaveni
#---------------------
class ComplaintsController < ApplicationController
		#Method:new
	   def new
	      @complainttypes = Complainttype.find(:all)	#Show all Complainttypes
	      @departments = Department.find(:all) 	# List Departments
	      @complaint = Complaint.new	    
	   end
	#End:new

	#Method:create
	   def create
	      @complaint = Complaint.new(params[:complaint])

	      @complaint.created_by = 1
	      @complaint.modified_by = 1

	    if @complaint.save
		flash[:notice] = 'Record successfully created.'
	     	redirect_to :action => 'list'

	      else
		@departments = Department.find(:all) 	# List Departments
		@complainttypes = Complainttype.find(:all)	#Show all Complainttypes
		    render :action => 'new'
	    end
	    
	    end 
	 # End of create
	
	#Method:list	
	   def list
	     @complaints = Complaint.find(:all, :conditions => "approved = 0")
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @complaints }	#Render to XML File
		end
	   end
	#End:list

	#Method:show
	 def show
	      @complaint = Complaint.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @complaints }	#Render to XML File
		end
	 end
	#End:show

	#Method:edit
	  def edit
	      @departments = Department.find(:all) 	# List Departments	
	      @complainttypes = Complainttype.find(:all)	#Show all Complainttypes
	      @complaint = Complaint.find(params[:id])	   
	  end
	#End:edit

	#Method:update
	  def update
	      @complaint = Complaint.find(params[:id])
	      @complaint.modified_by = 1

	      if @complaint.update_attributes(params[:complaint])
		 flash[:notice] = 'Bank Updated Sucessfully.'
			redirect_to :action => 'show', :id => @complaint
	      else
		@departments = Department.find(:all) 	# List Departments
		@complainttypes = Complainttype.find(:all)#Show all Complainttypes		
		 render :action => 'edit'
	      end
	   end
	#End:update

	#Method:delete
	def delete
		Complaint.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete
	#Method: Approve	- Which Approved after seeing the cmo
	def approve    
		@complaint = Complaint.find(params[:id])
		@complaint.approved = 1
		#@birth.approved_on = Time.now.strftime
	
		if @complaint.update_attributes(params[:complaint])
			flash[:notice] = 'complaint Record successfully approved.'
			redirect_to :action => 'list'
		else
			render :action => 'show'
		end
	end
	#End: Approve

	#Method: Approve Ok -- List all Approved complaints department wise
	def approved
		 @complainttypes = Complainttype.find(:all)	#Show all Complainttypes
	      @departments = Department.find(:all) 	# List Departments
		@complaints = Complaint.find(:all, :conditions => "approved = 1")
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @complaints }		#Render to XML File
    	end
		
	end
	#End: Approve Ok


	#method: search
	def search
		@query = params[:query]
		@complaints = Complaint.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

#method: Report Generation
	def complaintsreport
		@complaints = Complaint.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "complaintsreport.pdf", :type => 'application/pdf')
	end
	#End:report


end
