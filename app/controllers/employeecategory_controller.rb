#Author: Krishanevni
#Controller: Employee category Registration
#======================================
class EmployeecategoryController < ApplicationController
#Method: new
	def new
		@employeecategory = Employeecategory.new
	end
	#End:new

	#Method:create
	def create
		@employeecategory = Employeecategory.new(params[:employeecategory])
		@employeecategory.created_by = 1
		@employeecategory.modified_by = 1

		if @employeecategory.save
			flash[:notice] = 'Employee Type created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@employeecategories = Employeecategory.paginate :page => params[:page], :per_page => 10
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @employeecategories }		#Render to XML File
    	end
	end
	#End:list

	#Method:show
	def show
		@employeecategory = Employeecategory.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @employeecategories }		#Render to XML File
    	end
	end
	#End:show

	#Method:edit
	def edit
		@employeecategory = Employeecategory.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@employeecategory = Employeecategory.find(params[:id])
		@employeecategory.modified_by = 1
		if @employeecategory.update_attributes(params[:employeecategory])
			flash[:notice] = 'Employee Type updated Sucessfully.'
			redirect_to :action => 'show', :id => @employeecategory
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method: Delete
	def delete
		Employeecategory.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete
	#method: search
	def search
		@query = params[:query]
		@employeecategories = Employeecategory.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

end
