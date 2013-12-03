#Author: Chaitanya
#Controller: Properties (Property Tax)
#==============================================
class PropertyController < ApplicationController

	#Method:new
	def new
		@property = Property.new
		@propertytype = Propertytype.find(:all) #List all Property Types
	end
	#End:new

	#Method:create
	def create
		@property = Property.new(params[:property])

		@property.created_by = 1
		@property.modified_by = 1

		if @property.save
			flash[:notice] = 'Property Successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@properties = Property.paginate :page => params[:page], :per_page => 10
		respond_to do |format|
			format.html 
			format.xml  { render :xml => @properties }	# REnder to XML
		end 
	end
	#End:list

	#Method:show
	def show
		@property = Property.find(params[:id])
		respond_to do |format|
			format.html 
			format.xml  { render :xml => @properties }	# REnder to XML
		end 
	end
	#End:show

	#Method:edit
	def edit
		@property = Property.find(params[:id])
		@propertytype = Propertytype.find(:all)
	end
	#End:create

	#Method:update
	def update
		@property = Property.find(params[:id])
	
		@property.modified_by = 1
	
		if @property.update_attributes(params[:property])
			flash[:notice] = 'Property Successfully updated.'
			redirect_to :action => 'show', :id => @property
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Property.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@properties = Property.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

end
