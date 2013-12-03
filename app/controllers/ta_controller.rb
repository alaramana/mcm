#Author: Chaitanya
#controller: TA (Salary Calculation)
#==========================================
class TaController < ApplicationController
	#Method: New
	def new
		@ta = Ta.new
	end
	#End Method: New

	#Method: New
	def create
		@ta = Ta.new(params[:ta])
		@ta.created_by = 1
		@ta.modified_by = 1
		if @ta.save
			flash[:notice] = 'TA Account Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of create

	#Method: List
	def list
		@tas = Ta.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @tas }		#Render to XML File
    	end
	end
	#End Method: List

	#Method: show
	def show
		@ta = Ta.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @tas }		#Render to XML File
    	end
	end
	#End Method: show

	#Method: edit
	def edit
		@ta = Ta.find(params[:id])
	end
	#End Method: edit

	#Method: update
	def update
		@ta = Ta.find(params[:id])
		@ta.modified_by = 1

		if @ta.update_attributes(params[:ta])
			flash[:notice] = 'TA Account Updated Sucessfully.'
			redirect_to :action => 'show', :id => @ta
		else
			render :action => 'edit'
		end
	end
	#End Method: update

	#Method: New
	def delete
		Ta.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: delete
end
