#Author: Chaitanya
#controller: Salary (Calculation Salary)
#======================================================
class SalaryController < ApplicationController
	#Method: New
	def new
		@salary = Salary.new
	end
	#End Method: New

	#Method: New
	def create
		@salary = Salary.new(params[:da])
		@salary.created_by = 1
		@salary.modified_by = 1
		
		if @salary.save
			flash[:notice] = 'Salary Account Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@salaries = Loanaccount.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @salaries }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: show
	def show
		@salary = Salary.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @salaries }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@salary = Salary.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@salary = Salary.find(params[:id])

		@salary.modified_by = 1

		if @salary.update_attributes(params[:da])
			flash[:notice] = 'Salary Account Updated Sucessfully.'
			redirect_to :action => 'show', :id => @salary
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Salary.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete

end
