#Author: Chaitanya
#---------------------

class HospitalController < ApplicationController
	#method: new
	def new
	@hospital = Hospital.new
	end
	#End method: new

	#mthod: create
	def create
	@hospital = Hospital.new(params[:hospital])
	@hospital.created_by = 1
	@hospital.modified_by = 1

		if @hospital.save
		flash.now[:notice] = 'Hospital successfully created.'
		redirect_to :action => 'list'
		else
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@hospitals = Hospital.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @hospitals }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@hospital = Hospital.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @hospitals }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@hospital = Hospital.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@hospital = Hospital.find(params[:id])

	@hospital.modified_by = 1
		if @hospital.update_attributes(params[:hospital])
		redirect_to :action => 'show', :id => @hospital
		flash.now[:notice] = 'Hospital successfully created.'
		else
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Hospital.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete	

	#method: search
	def search
		@query = params[:query]
		@hospitals = Hospital.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

	#method: Report Generation
	def hospitalreport
		@hospitals = Hospital.find (:all)
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "hospitalreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
