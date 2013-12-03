#Author: Chaitanya
#Controller: Unit Values for Property Tax 
#=============================
class UnitvalueController < ApplicationController
	#Method:new
	def new
		@unitvalue = Unitvalue.new
		@taxcategory = Taxcategory.find(:all)
	end
	#End:new

	#Method:create
	def create
		@unitvalue = Unitvalue.new(params[:unitvalue])

		@unitvalue.created_by = 1
		@unitvalue.modified_by = 1

		if @unitvalue.save
			flash[:notice] = 'Unti Value successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@unitvalues = Unitvalue.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @unitvalues }		#Render to XML File
		end
	end
	#End:list

	#Method:show
	def show
		@unitvalue = Unitvalue.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @unitvalues }		#Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@unitvalue = Unitvalue.find(params[:id])
		@taxcategory = Taxcategory.find(:all)
	end
	#End:edit

	#Method:update
	def update
		@unitvalue = Unitvalue.find(params[:id])
		@unitvalue.modified_by = 1

		if @unitvalue.update_attributes(params[:unitvalue])
			flash[:notice] = 'Unti Value successfully updated.'
			redirect_to :action => 'show', :id => @unitvalue
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delete
	def delete
		Unitvalue.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End: Delete

	#Method:search
	def search		
		 @query = params[:query]
		 @unitvalues = Unitvalue.search @query, :page => params[:page], :per_page => 10	
	end	
	#End:search
end
