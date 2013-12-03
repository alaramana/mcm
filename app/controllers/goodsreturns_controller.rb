#Author: Krishnaveni
#---------------------
class GoodsreturnsController < ApplicationController
	#method: new
	def new
	@goodsreturn = Goodsreturn.new
	@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
	end
	#End method: new

	#mthod: create
	def create
	@goodsreturn = Goodsreturn.new(params[:goodsreturn])
	@goodsreturn.created_by = 1
	@goodsreturn.modified_by = 1

		if @goodsreturn.save
		flash.now[:notice] = 'Goodsreturn successfully created.'
		redirect_to :action => 'list'
		else
		@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
		render :action => 'new'
		end
	end 
	# End of create

	#method: list
	def list
	@goodsreturns = Goodsreturn.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @goodsreturns }		#Render to XML File
		end
	end
	#End method: list

	#method: show
	def show
	@goodsreturn = Goodsreturn.find(params[:id])
		respond_to do |format|		
		format.html 
		format.xml  { render :xml => @goodsreturns }		#Render to XML File
		end
	end
	#End method: show

	#method: edit
	def edit
	@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
	@goodsreturn = Goodsreturn.find(params[:id])
	end
	#End method: edit

	#method: update
	def update
	@goodsreturn = Goodsreturn.find(params[:id])

	@goodsreturn.modified_by = 1
		if @goodsreturn.update_attributes(params[:goodsreturn])
		redirect_to :action => 'show', :id => @goodsreturn
		flash.now[:notice] = 'Goodsreturn successfully created.'
		else
		@itemmaster = Itemmaster.find(:all)		#Show all Itemmasters
		render :action => 'edit'
		end
	end
	#End method: update

	#Method: Delete
	def delete
	Goodsreturn.find(params[:id]).destroy
	redirect_to :action => 'list'
	end
	#End Method: Delete

	#Method:search
	def search		
		 @query = params[:query]
		 @goodsreturns = Goodsreturn.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search	
#method: Report Generation
	def goodsreturnreport
		@goodsreturns = Goodsreturn.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "goodsreturnreport.pdf", :type => 'application/pdf')
	end
	#End:report
end
