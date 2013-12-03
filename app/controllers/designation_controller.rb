#Author: Chaitanya
#-------------------------
class DesignationController < ApplicationController

	#Method:new
	def new
		@designation = Designation.new
	end
	#End:new

	#Method:create
	def create
		@designation = Designation.new(params[:designation])
		@designation.created_by = 1
		@designation.modified_by = 1
		if @designation.save
			flash[:notice] = 'Designation successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@designations = Designation.paginate :page => params[:page], :per_page => 10
   		respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @designations }		#Render to XML File
    	end		
	end
	#End:list

	#Method:show
	def show
		@designation = Designation.find(params[:id])
   		respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @designations }		#Render to XML File
    	end		
	end
	#End:show

	#Method:edit
	def edit
		@designation = Designation.find(params[:id])
	end
	#End:edit

	#Method: update
	def update
		@designation = Designation.find(params[:id])

		@designation.modified_by = 1

		if @designation.update_attributes(params[:designation])
			flash[:notice] = 'Designation successfully updated.'
			redirect_to :action => 'show', :id => @designation
		else
			render :action => 'edit'
		end
	end
	#End:update

	#Method:Delete
	def delete
		Designation.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete

	#method: search
	def search
		@query = params[:query]
		@designations = Designation.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

	#method: Report Generation
	def report
		@designations = Designation.find(:all)


    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "designationreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
