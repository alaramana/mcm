#Author: Krishnaveni
#---------------------
class ItemcategoriesController < ApplicationController
	#method: new
	def new
	@itemcategory = Itemcategory.new
	end
	#End method: new

	#mthod: create
	def create
	@itemcategory = Itemcategory.new(params[:itemcategory])
	@itemcategory.created_by = 1
	@itemcategory.modified_by = 1

		if @itemcategory.save
		flash.now[:notice] = 'Itemcategory successfully created.'
		redirect_to :action => 'list'
		else
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@itemcategories = Itemcategory.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @itemcategories }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@itemcategory = Itemcategory.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @itemcategories }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	     @itemcategory = Itemcategory.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@itemcategory = Itemcategory.find(params[:id])

	@itemcategory.modified_by = 1
		if @itemcategory.update_attributes(params[:itemcategory])
		redirect_to :action => 'show', :id => @itemcategory
		flash.now[:notice] = 'Itemcategory successfully created.'
		else
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Itemcategory.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete
	
	#Method:search
	def search		
		 @query = params[:query]
		 @itemcategories = Itemcategory.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search	
#method: Report Generation
	def itemcategoryreport
		@itemcategories = Itemcategory.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "itemcategoryreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
