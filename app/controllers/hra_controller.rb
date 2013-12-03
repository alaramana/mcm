#Author: Chaitanya
#controller: HRA (Salary Calculation)
#=====================================================
class HraController < ApplicationController
	#Method: New
	def new
		@hra = Hra.new		
	end
	#End Method: New

	#Method: New
	def create
		@hra = Hra.new(params[:hra])
		@hra.created_by = 1
		@hra.modified_by = 1
		if @hra.save
			flash[:notice] = 'HRA Account Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@hras = Hra.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @hras }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: show
	def show
		@hra = Hra.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @hras }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@hra = Hra.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@hra = Hra.find(params[:id])
		@hra.modified_by = 1

		if @hra.update_attributes(params[:hra])
			flash[:notice] = 'HRA Account Updated Sucessfully.'
			redirect_to :action => 'show', :id => @hra
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Hra.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete
end
