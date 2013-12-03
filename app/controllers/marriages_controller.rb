#Author: Krishanevni
#Controller: Marriage Registration
#======================================
class MarriagesController < ApplicationController
	#Method:new
	def new
		@marriage = Marriage.new
	end
	#End:new

	#Method:create
	def create
		@marriage = Marriage.new(params[:marriage])
		@marriage.created_by = 1
		@marriage.modified_by = 1
	
		if @marriage.save
			flash[:notice] = 'Marriage Record successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@marriages = Marriage.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @marriages } #Render to XML File
                        format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }

		end
	end
	#End:list

	#Method:show
	def show
		@marriage = Marriage.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @marriages } #Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@marriage = Marriage.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@marriage = Marriage.find(params[:id])

		@marriage.modified_by = 1
	
		if @marriage.update_attributes(params[:marriage])
			flash[:notice] = 'Marriage Record successfully Updated.'
			redirect_to :action => 'show', :id => @marriage
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Marriage.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@marriages = Marriage.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search


#Method: Approve	- Which Approve after Verificatin for Certificate
	def approve    
		@marriage = Marriage.find(params[:id])
		@marriage.approved = 1
		#@birth.approved_on = Time.now.strftime
	
		if @marriage.update_attributes(params[:marriage])
			flash[:notice] = 'marriage Record successfully approved.'
			redirect_to :action => 'list'
		else
			render :action => 'show'
		end
	end
	#End: Approve

	#Method: Approve Ok -- List all Approved 
	def approved
		@approves = Marriage.find(:all, :conditions => "approved = 1")
    	respond_to do |format|		
     		    format.html 
      	            format.xml  { render :xml => @approves }		#Render to XML File
 format.pdf { send_data render_to_pdf({ :action => '', :layout => 'standard' }) }
    	end
		
	end
	#End: Approve Ok

	#Method: Not approved -- List all Not Approved Records
	def notapproved
		@notapproves = Marriage.find(:all, :conditions => "approved = 0")
    	respond_to do |format|		
     		    format.html 
      		    format.xml  { render :xml => @notapproves }		#Render to XML File
          format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }
    	end
	end
	#End: Not Approved
	
	#method: Report Generation
	def reportall
		@marriges = Marriage.find(:all, :order =>"register_id")
   		html = render :layout => false 
		kit = PDFKit.new(html)

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "marriagereport.pdf", :type => 'application/pdf')
	end
	#End:report

	#method: Report Generation
	def printcertificate
		@marriage = Marriage.find(params[:id])
   		html = render :layout => false 
		kit = PDFKit.new(html)

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "marriagecertificate.pdf", :type => 'application/pdf')
	end
	#End:report



end
