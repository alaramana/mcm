#Author: Krishnaveni
#---------------------
class GoodsreceivesController < ApplicationController
	#method: new
	def new
	@goodsreceive = Goodsreceive.new
	@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
	end
	#End method: new

	#mthod: create
	def create
	@goodsreceive = Goodsreceive.new(params[:goodsreceive])
	@goodsreceive.created_by = 1
	@goodsreceive.modified_by = 1

		if @goodsreceive.save
		flash.now[:notice] = 'Goodsreceive successfully created.'
		redirect_to :action => 'list'
		else
		@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@goodsreceives = Goodsreceive.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @goodsreceives }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@goodsreceive = Goodsreceive.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @goodsreceives }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
	@goodsreceive = Goodsreceive.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@goodsreceive = Goodsreceive.find(params[:id])

	@goodsreceive.modified_by = 1
		if @goodsreceive.update_attributes(params[:goodsreceive])
		redirect_to :action => 'show', :id => @goodsreceive
		flash.now[:notice] = 'Goodsreceive successfully created.'
		else
		@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Goodsreceive.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete	

	#Method:search
	def search		
		 @query = params[:query]
		 @goodsreceives = Goodsreceive.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search
#method: Report Generation
	def goodsreceivereport
		@goodsreceives = Goodsreceive.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "goodsreceivereport.pdf", :type => 'application/pdf')
	end
	#End:report

end
