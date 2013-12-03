#Author: Chiatanya
#Controller: Departments
#=================================================
class DepartmentController < ApplicationController

	#Method:new
	def new
		@department = Department.new
	end
	#End: new

	#Method: create
	def create
		@department = Department.new(params[:department])
		@department.created_by = 1
		@department.modified_by = 1

		if @department.save
			flash.now[:notice] = '#{@department.title} Department successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	# End of create

	#Method: list
	def list
		@departments = Department.paginate :page => params[:page], :per_page => 10	#Pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @departments }		#Render to XML File
    	end		
	end
	#End: list

	#Method: show
	def show
		@department = Department.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @departments }		#Render to XML File
    	end		
	end
	#End:show

	#Method:edit
	def edit
		@department = Department.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@department = Department.find(params[:id])
		@department.modified_by = 1

		if @department.update_attributes(params[:department])
			flash.now[:notice] = '#{@department.title} Department successfully Updated.'
			redirect_to :action => 'show', :id => @department
		else
			render :action => 'edit'
		end
	end
	#End: update

	#Method:Delete
	def delete
		Department.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	#method: search
	def search
		@query = params[:query]
		@departments = Department.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

	#method: Report Generation
	def report
		@departments = Department.find(:all)


    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "departmentreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
