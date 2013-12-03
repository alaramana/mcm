#Author: Chaitanya
#Controller: Tax Controller (Property Tax)
#=============================
class TaxController < ApplicationController
	#Method:new
	def new
		@tax = Tax.new
	end
	#End:create

	#Method:create
	def create
		@tax = Tax.new(params[:tax])
	
		@tax.created_by = 1
		@tax.modified_by = 1
	
		if @tax.save
			flash[:notice] = 'Tax successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end 
	#End:create

	#Method:list
	def list
		@taxes = Tax.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @taxes }		#Render to XML File
		end
	end
	#End:list

	#Method:show
	def show
		@tax = Tax.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @taxes }		#Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@tax = Tax.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@tax = Tax.find(params[:id])
	
		@tax.modified_by = 1
	
		if @tax.update_attributes(params[:tax])
			flash[:notice] = 'Tax successfully updated.'
			redirect_to :action => 'list'
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:delet
	def delete
		Tax.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:Delete

	#Method:search
	def search		
		 @query = params[:query]
		 @taxes = Tax.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search
end
