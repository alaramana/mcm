#Author: Chaitanya
#Controller: Loan Account
#==========================================================
class LoanaccountController < ApplicationController
	#Method: New
	def new
		@loanaccount = Loanaccount.new
		@employee = Employee.find(:all)
	end
	#End Method: New

	#Method: create
	def create
		@loanaccount = Loanaccount.new(params[:loanaccount])
		@loanaccount.created_by  = 1
		@loanaccount.modified_by = 1
		if @loanaccount.save
			flash[:notice] = 'Loan Account Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@employee = Employee.find(:all)
		@loanaccounts = Loanaccount.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     format.html 
  			format.xml  { render :xml => @loanaccounts }		#Render to XML File
                	end
	end
	#End Method: List

	#Method: show
	def show
		@employee = Employee.find(:all)
		@loanaccount = Loanaccount.find(params[:id])
    	respond_to do |format|		
     format.html 
     format.xml  { render :xml => @loanaccounts }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@loanaccount = Loanaccount.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@loanaccount = Loanaccount.find(params[:id])
		@loanaccount.modified_by = 1
		if @loanaccount.update_attributes(params[:da])
			flash[:notice] = 'Loan Account Updated Sucessfully.'
			redirect_to :action => 'show', :id => @loanaccount
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Loanaccount.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete

#method: search
	def search
		@query = params[:query]
		@loanaccounts = Loanaccount.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

#method: Report Generation
	def loanaccountreport
		@loanaccounts = Loanaccount.find(:all, :order=>"loanaccountno")		
 	 html = render :layout => false 
 	kit = PDFKit.new(html)
 	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 
 	send_data(kit.to_pdf, :filename => "loanaccountreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
