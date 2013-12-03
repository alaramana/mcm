#Author: Chaitanya
#controller: BPay (Salary)
#==========================================
class BpayController < ApplicationController
	#Method: New
	def new
		@bpay = Bpay.new
		@designation = Designation.find(:all)     			# List Designations
		@department = Department.find(:all) 				# List Departments
	end
	#End Method: New

	#Method: New
	def create
		@bpay = Bpay.new(params[:bpay])
		@bpay.created_by = 1
		@bpay.modified_by = 1
		if @bpay.save
			flash[:notice] = 'Basic Pay Account Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@bpays = Bpay.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @bpays }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: show
	def show
		@bpay = Bpay.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @bpays }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@bpay = Bpay.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@bpay = Bpay.find(params[:id])
		@bpay.modified_by = 1

		if @bpay.update_attributes(params[:bpay])
			flash[:notice] = 'Basic Pay Account Updated Sucessfully.'
			redirect_to :action => 'show', :id => @bpay
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Bpay.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete
end
