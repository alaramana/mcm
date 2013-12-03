#Author: Chaitanya
#Controller : Bank Details
#-----------------------
class BankController < ApplicationController
def index
    @banks = Bank.find(:all)

     respond_to do |format|
  	    format.xml { render :text => @banks.to_xml }
  	    format.pdf  { render :collection => @banks }
  	    format.html #default
    end
  end

	#Method: New Bank Entry
	def new
		@bank = Bank.new
	end

	#Method: Create Entry
	def create
		@bank = Bank.new(params[:bank])
  		@bank.created_by = 1
		@bank.modified_by = 1

		if @bank.save
			flash[:notice] = 'Bank Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end #End of If condition @bank.save
	end  
	# End of create

	#Method: List of Banks
	def list
		@banks = Bank.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @banks }		#Render to XML File
    	end
		
	end
	#End of method: List

	#Method: Show Bank Details
	def show
		@bank = Bank.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @banks }		#Render to XML File
    	end
	end
	#End of Method Show

	#Method: Edit Bank Details
	def edit
		@bank = Bank.find(params[:id])
	end
	#End of Edit

	#Method: Update Bank Details
	def update
		@bank = Bank.find(params[:id])
		@bank.modified_by = 1

		if @bank.update_attributes(params[:bank])
			flash[:notice] = 'Bank Updated Sucessfully.'
			redirect_to :action => 'show', :id => @bank
		else
			render :action => 'edit'
		end 
	end
	#End of Method Update

	#Method: search
	def search
		@query = params[:query]
		@banks = Bank.search @query, :page => params[:page], :per_page => 10		

	end

	#End of search Method

end
