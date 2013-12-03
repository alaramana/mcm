#Author: Chaitanya
#Controller: Employee Types
#===========================================
class EmployeetypeController < ApplicationController

	#Method: new
	def new
		@employeetype = Employeetype.new
	end
	#End:new

	#Method:create
	def create
		@employeetype = Employeetype.new(params[:employeetype])
		@employeetype.created_by = 1
		@employeetype.modified_by = 1

		if @employeetype.save
			flash[:notice] = 'Employee Type created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@employeetype = Employeetype.paginate :page => params[:page], :per_page => 10
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @employeetypes }		#Render to XML File
    	end
	end
	#End:list

	#Method:show
	def show
		@employeetype = Employeetype.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @employeetypes }		#Render to XML File
    	end
	end
	#End:show

	#Method:edit
	def edit
		@employeetype = Employeetype.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@employeetype = Employeetype.find(params[:id])
		@employeetype.modified_by = 1
		if @employeetype.update_attributes(params[:employeetype])
			flash[:notice] = 'Employee Type updated Sucessfully.'
			redirect_to :action => 'show', :id => @employeetype
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method: Delete
	def delete
		Employeetype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete
	#method: search
	def search
		@query = params[:query]
		@employeetypes = Employeetype.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

end
