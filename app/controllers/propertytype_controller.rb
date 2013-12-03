#Author: Chaitanya
#Controller: Property Types (Property Tax)
#======================================================
class PropertytypeController < ApplicationController

def index
    @propertytypes = Propertytype.find(:all)

     respond_to do |format|
  	    format.xml { render :text => @propertytypes.to_xml }
  	    format.pdf  { render :collection => @propertytypes }
  	    format.html #default
    end
  end


      #Method:new
	def new
		@propertytype = Propertytype.new
	end
	#End:new

	#Method:crate
	def create
		@propertytype = Propertytype.new(params[:propertytype])
		@propertytype.created_by = 1
		@propertytype.modified_by = 1
		
		if @propertytype.save
			flash[:notice] = 'Property Type successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@propertytypes = Propertytype.paginate :page => params[:page], :per_page => 10
		respond_to do |format|
			format.html 
			format.xml  { render :xml => @propertytypes } #Render to XML 
		end 
	end
	#End:list

	#Method:show
	def show
		@propertytype = Propertytype.find(params[:id])
		respond_to do |format|
			format.html 
			format.xml  { render :xml => @propertytypes } #Render to XML 
		end 
	end
	#End:show

	#Method:edit
	def edit
		@propertytype = Propertytype.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@propertytype = Propertytype.find(params[:id])
	
		@propertytype.modified_by = 1
	
		if @propertytype.update_attributes(params[:propertytype])
			flash[:notice] = 'Property Type successfully created.'
			redirect_to :action => 'show', :id => @propertytype
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Propertytype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@propertytypes = Propertytype.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search
end
