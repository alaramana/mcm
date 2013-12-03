#Author: Chaitanya
#Controller: Employee Registrations
#======================================================
class EmployeeController < ApplicationController

	#Method:new
	def new
		@employee = Employee.new
		@religion = Religion.find(:all)						# List all Religions
		@caste = Caste.find(:all)							# List all Castes
		@marital = Marital.find(:all)						# List all Maritals
		@gender = Gender.find(:all) 						# List Genders
		@designation = Designation.find(:all)     			# List Designations
		@department = Department.find(:all) 				# List Departments
		@bank = Bank.find(:all)								# List Banks
		@employeetype = Employeetype.find(:all)				# List Employee Types
		@employeecategory = Employeecategory.find(:all)
	end
	#End:new

	#Method:
	def create
		@employee = Employee.new(params[:employee])
		@employee.created_by = 1
		@employee.modified_by = 1

		if @employee.save
			flash[:notice] = 'Employee Created Sucessfully.'
			redirect_to :action => 'list'
		else
			@religion = Religion.find(:all)
			@caste = Caste.find(:all)
			@marital = Marital.find(:all)
			@gender = Gender.find(:all) 	
			@designation = Designation.find(:all)
			@department = Department.find(:all)
			@bank = Bank.find(:all)
			@employeetype = Employeetype.find(:all)
			@employeecategory = Employeecategory.find(:all)
			render :action => 'new'
		end
	end  
	#End:create

	#Method:list
	def list
		@employees = Employee.paginate :page => params[:page], :per_page => 10	#pagination
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @employees }
                          format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }
              
    	end
	end
	#End:list

	#Method:show
	def show
		@employee = Employee.find(params[:id])
    	respond_to do |format|		
     		    format.html 
      			format.xml  { render :xml => @employees }		#Render to XML File
    	end
	end
	#End:show

	#Method:edit
	def edit
		@religion = Religion.find(:all)
		@caste = Caste.find(:all)
		@marital = Marital.find(:all)
		@gender = Gender.find(:all) 	
		@designation = Designation.find(:all)
		@department = Department.find(:all) 
		@bank = Bank.find(:all)
		@employeetype = Employeetype.find(:all)
		@employeecategory = Employeecategory.find(:all)
		@employee = Employee.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@employee = Employee.find(params[:id])

		@employee.modified_by = 1

		if @employee.update_attributes(params[:employee])
			flash[:notice] = 'Employee Updated Sucessfully.'
			redirect_to :action => 'show', :id => @employee
		else
			render :action => 'edit'
		end
	end
	#End:update
	
	#Method:Delete
	def delete
		Employee.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End Method: Delete
	#method: search
	def search
		@query = params[:query]
		@employees = Employee.search @query, :page => params[:page], :per_page => 20
	end
	#End Method: search

	#method: Report Generation
	def employeereport
		@employees = Employee.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "employeereport.pdf", :type => 'application/pdf')
	end
	#End:report


	
end
