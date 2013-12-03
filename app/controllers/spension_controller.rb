#Author: Krishnaveni
#==============
class SpensionController < ApplicationController
#Method: New
	def new
		@spension = Spension.new
		@ssccategory = Ssccategory.find(:all)		#Show all Ssccategory
		@gender = Gender.find(:all)	#Show all Gender
	end
	#End of Method: New

	#Method: Create
	def create
		@spension = Spension.new(params[:spension])

		@spension.created_by = 1
		@spension.modified_by = 1
	
		if @spension.save
			flash[:notice] = 'spensions Created Sucessfully.'
			redirect_to :action => 'list'
		else
		@ssccategory = Ssccategory.find(:all)		#Show all Ssccategory
		@gender = Gender.find(:all)	#Show all Gender
			render :action => 'new'
		end
	end  
	#End Method: Create

	#Method: List
	def list
		@spensions = Spension.paginate :page => params[:page], :per_page => 10	

		respond_to do |format|
	 		    format.html # list.html.erb
	  			format.xml  { render :xml => @spensions }	#Render to XML Files
		end
	end
	#End Method: List

	#Method: Show
	def show
		@spension = Spension.find(params[:id])
    	respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @spensions }	#Render to XML File
    	end
	end
	#End Method:Show

	#Method: Edit
	def edit
		@ssccategory = Ssccategory.find(:all)	#Show all Ssccategory
		@gender = Gender.find(:all)	#Show all Gender
		@spension = Spension.find(params[:id])
		
	end
	#End Method:Edit

	#Method: Update
	def update
		@spension = Spension.find(params[:id])

		@spension.modified_by = 1

		if @spension.update_attributes(params[:spension])
			flash[:notice] = 'spension Updated Sucessfully.'
			redirect_to :action => 'show', :id => @spension
		else
		@ssccategory = Ssccategory.find(:all)	#Show all Ssccategory
		@gender = Gender.find(:all)	#Show all Gender
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method: Delete
	def delete
		Spension.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete

		
	#Method: Approve	- Which Approve after Verificatin for Certificate
	def approve    
		@spension = Spension.find(params[:id])
		@spension.approved = 1
	
		if @spension.update_attributes(params[:spension])
			flash[:notice] = 'Spension Record successfully approved.'
			redirect_to :action => 'list'
		else
			render :action => 'show'
		end
	end
	#End: Approve
	
	def reject    
		@spension = Spension.find(params[:id])
		@spension.approved = 0
	
		if @spension.update_attributes(params[:spension])
			flash[:notice] = 'Spension Record successfully rejected.'
			redirect_to :action => 'list'
		else
			render :action => 'show'
		end
	end
	#End: Approve

	#Method: Approve Ok -- List all Approved 
	def approved
		@ssccategory = Ssccategory.find(:all)
		@approves = Spension.find(:all, :conditions => "approved = 1")
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @spensions }	#Render to XML File
    	end
		
	end
	#End: Approve Ok

	#Method: Not approved -- List all Not Approved Records
	def notapproved
		@ssccategory = Ssccategory.find(:all)
		@notapproves = Spension.find(:all, :conditions => "approved = 0")
    	        respond_to do |format|		
      		     format.html 
      		     format.xml  { render :xml => @spensions }	#Render to XML File
    	end
	end
	#End: Not Approved

	#Method:search
	def search		
		 @query = params[:query]
		 @spensions = Spension.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search

#method: Report Generation
	def spensionreport
		@spensions = Spension.find(:all, :order => "spension_number")		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "spensionreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
