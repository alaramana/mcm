#Author: Chaitanya
#Controller: Tax Category for Property Tax
#==================================
class TaxcategoryController < ApplicationController

# => Method: Crate new Category	
	def new
		@taxcategory = Taxcategory.new
	end
	#end Method New

	#Method: Save new Category	
	def create
		@taxcategory = Taxcategory.new(params[:taxcategory])

		@taxcategory.created_by = 1
		@taxcategory.modified_by = 1

		if @taxcategory.save
			flash[:notice] = 'Tax Category successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End of Save Method

	#Method: List
	def list
		@taxcategories = Taxcategory.paginate :page => params[:page], :per_page => 10 # Pagination
		respond_to do |format|		
     	    format.html 
      		format.xml  { render :xml => @taxcategories }		#Render to XML File
    	end

	end
	#End Method: List

	#Method: Display the Cataegory
	def show
		@taxcategory = Taxcategory.find(params[:id])
		respond_to do |format|		
     	    format.html 
      		format.xml  { render :xml => @taxcategories }		#Render to XML File
    	end

	end
	#End Method: Display Category

	#Method: Edit the Cataegor
	def edit
		@taxcategory = Taxcategory.find(params[:id])
	end
	#End Method: Edit

	#Method: Update	
	def update
		@taxcategory = Taxcategory.find(params[:id])

		@taxcategory.modified_by = 1

		if @taxcategory.update_attributes(params[:taxcategory])
			flash[:notice] = 'Tax Category successfully updated.'
			redirect_to :action => 'show', :id => @taxcategory
		else
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method: Delete
	def delete
		Taxcategory.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete

	#Method:search
	def search		
 @query = params[:query]
 @taxcategoriess = Taxcategory.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search

end
