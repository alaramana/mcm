#Author: Chaitanya
#Controller:Organization Type
#-----------------------
class OrganizationtypeController < ApplicationController
	#Metod: New
	def new
		@organizationtype = Organizationtype.new
	end
	#End Method: New

	#Method: Save
	def create
		@organizationtype = Organizationtype.new(params[:organizationtype])

		@organizationtype.created_by = 1
		@organizationtype.modified_by = 1

		if @organizationtype.save
			flash[:notice] = 'Organization Type Created Sucessfully.'
			redirect_to :action => 'list'

		else
			render :action => 'new'
		end
	end  
	#End Method: Save

	#Method: List all
	def list
		@organizationtypes = Organizationtype.paginate :page => params[:page], :per_page => 10
	    	respond_to do |format|
	     		    format.html # list.html.erb
	      			format.xml  { render :xml => @organizationtypes }
	    	end
	end
	#End Method: List all

	#Method: Show
	def show
		@organizationtype = Organizationtype.find(params[:id])
		respond_to do |format|
     		    format.html # show.html.erb
      			format.xml  { render :xml => @organizationtypes }
    		end 
	end
	#End Method: Show

	#Method: Edit
	def edit
		@organizationtype = Organizationtype.find(params[:id])
	end
	#End Method: Edit

	#Method: Update
	def update

		@organizationtype = Organizationtype.find(params[:id])
		@organizationtype.modified_by = 1

		if @organizationtype.update_attributes(params[:organizationtype])
			flash[:notice] = 'Organization Type Updated Sucessfully.'
			redirect_to :action => 'show', :id => @organizationtype
		else
			render :action => 'edit'
		end
	end
	#End Method: Update

	#Method: Delete
	def delete
		Organizationtype.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete

	#method: search
	def search
		@query = params[:query]
		@organizationtypes = Organizationtype.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search
end
