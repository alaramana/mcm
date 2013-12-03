#Author: Chaitanya
#controller: Occupancy factor (Property Tax)
#==========================================================
class OccupancyfactorController < ApplicationController

	#Method:new
	def new
		@occupancyfactor = Occupancyfactor.new
	end
	#End:new

	#Method:crate
	def create
		@occupancyfactor = Occupancyfactor.new(params[:occupancyfactor])
		@occupancyfactor.created_by = 1
		@occupancyfactor.modified_by = 1
	
		if @occupancyfactor.save
			flash.now[:notice] = 'Occupancy Factor successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End:create

	#Method:list
	def list
		@occupancyfactors = Occupancyfactor.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @occupancyfactors }#Render to XML File
		end
	end
	#End:list

	#Method:shwo
	def show
		@occupancyfactor = Occupancyfactor.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @occupancyfactors }#Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@occupancyfactor = Occupancyfactor.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@occupancyfactor = Occupancyfactor.find(params[:id])
		@occupancyfactor.modified_by = 1
	
		if @occupancyfactor.update_attributes(params[:occupancyfactor])
			flash.now[:notice] = 'Occupancy Factor successfully updated.'
			redirect_to :action => 'show', :id => @occupancyfactor
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Occupancyfactor.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete
	
	#method: search
	def search
		@query = params[:query]
		@occupancyfactors = Occupancyfactor.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

end

