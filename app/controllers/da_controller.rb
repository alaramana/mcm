#Author: Chaitanya
#controller: DA (Salary0
#================================================
class DaController < ApplicationController
	#Method: New
	def new
		@da = Da.new		
	end
	#End Method: New

	#Method: New
	def create
		@da = Da.new(params[:da])
		@da.created_by = 1
		@da.modified_by = 1
		if @da.save
			flash[:notice] = 'DA Account Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@das = Da.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @das }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: show
	def show
		@da = Da.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @das }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@da = Da.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@da = Da.find(params[:id])
		@da.modified_by = 1

		if @da.update_attributes(params[:da])
			flash[:notice] = 'DA Account Updated Sucessfully.'
			redirect_to :action => 'show', :id => @da
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Da.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete
end
