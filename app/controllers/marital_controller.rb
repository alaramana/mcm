#Author: Chaitanya
#Controller: Marital Status
#======================================
class MaritalController < ApplicationController

	#Method:new
	def new
		@marital = Marital.new
	end
	#End:new

	#Method:create
	def create
		@marital = Marital.new(params[:marital])
		@marital.created_by = 1
		@marital.modified_by = 1
	
		if @marital.save
			flash[:notice] = 'Marital Record successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@maritals = Marital.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @maritals } #Render to XML File
		end
	end
	#End:list

	#Method:show
	def show
		@marital = Marital.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @maritals } #Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@marital = Marital.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@marital = Marital.find(params[:id])

		@marital.modified_by = 1
	
		if @marital.update_attributes(params[:marital])
			flash[:notice] = 'Marital Record successfully Updated.'
			redirect_to :action => 'show', :id => @marital
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Marital.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@maritals = Marital.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

end
