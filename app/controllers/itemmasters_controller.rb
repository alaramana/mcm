#Author: Krishnaveni
#---------------------
class ItemmastersController < ApplicationController
	#method: new
	def new
	@itemmaster = Itemmaster.new
	@itemcategory = Itemcategory.find(:all)		#Show all itemcategorys
	end
	#End method: new

	#mthod: create
	def create
	@itemmaster = Itemmaster.new(params[:itemmaster])
	@itemmaster.created_by = 1
	@itemmaster.modified_by = 1

		if @itemmaster.save
		flash.now[:notice] = 'Itemmaster successfully created.'
		redirect_to :action => 'list'
		else
		@itemcategory = Itemcategory.find(:all)		#Show all itemcategorys
		render :action => 'new'
		end
	end 
	# End of create
#method: Report Generation
	def billpassingreport
		@billpassings = Billpassing.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "billpassingreport.pdf", :type => 'application/pdf')
	end
	#End:report
	#method: list
	def list
	@itemmasters = Itemmaster.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @itemmasters }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@itemmaster = Itemmaster.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @itemmasters }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@itemcategory = Itemcategory.find(:all)		
	@itemmaster = Itemmaster.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@itemmaster = Itemmaster.find(params[:id])

	@itemmaster.modified_by = 1
		if @itemmaster.update_attributes(params[:itemmaster])
		redirect_to :action => 'show', :id => @itemmaster
		flash.now[:notice] = 'Itemmaster successfully created.'
		else
		@itemcategory = Itemcategory.find(:all)		#Show all itemcategorys
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Itemmaster.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete	

	#Method:search
	def search		
		 @query = params[:query]
		 @itemmasters = Itemmaster.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search
#method: Report Generation
	def itemmasterreport
		@billpassings = Billpassing.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "itemmasterreport.pdf", :type => 'application/pdf')
	end
	#End:report	
end
