#Author: Krishnaveni
#---------------------
class LicenseController < ApplicationController

require 'csv'
def create_CSV_file
@licenses=License.find(:all)
report = StringIO.new
CSV::Writer.generate(report, ',') do |title|
title << ['LicenseNumber','Name','ShopName']
@licenses.each do |c|
title << [c.license_number,c.last_name,c.shop_name]
end
end
report.rewind
send_data(report.read,:type=>'text/csv;charset=iso-8859-1;',:filename=>'report.csv',
:disposition =>'attachment', :encoding => 'utf8')
end 


  	#Method:new
	   def new
	        @license = License.new		
		@licensetype = Licensetype.find(:all)	#Show All Licensetype		
		@ward = Ward.find(:all)
		@street = Street.find(:all)	
	   end
	#End:new

	#Method:create
	   def create
	      @license = License.new(params[:license])

	      @license.created_by = 1
	      @license.modified_by = 1

	    if @license.save
		flash[:notice] = 'Record successfully created.'
	     	redirect_to :action => 'list'

	      else
		@licensetype = Licensetype.find(:all)	#Show All Licensetype	
		
		@ward = Ward.find(:all)
		@street = Street.find(:all)	
		    render :action => 'new'
	    end
	    
	    end 
	 # End of create
	
	#Method:list	
	   def list
	     @licenses = License.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			 format.html # index.html
                         format.xml  { render :xml => @licenses }
         format.pdf { send_data render_to_pdf({ :action => 'list.rpdf', :layout => 'standard' }) }
              
		end
	   end
	#End:list

	#Method:show
	 def show
	      @license = License.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @licenses }  #Render to XML File
		end
	 end
	#End:show

	#Method:edit
	  def edit
		@licensetype = Licensetype.find(:all)	#Show All Licensetype	
		@ward = Ward.find(:all)
		@street = Street.find(:all)	
	        @license = License.find(params[:id])
	   
	  end
	#End:edit


require 'csv'
def create_CSV_file
@licenses=License.find(:all)
report = StringIO.new
CSV::Writer.generate(report, ',') do |title|
title << ['LicenseNumber','Name','ShopName']
@licenses.each do |c|
title << [c.license_number,c.last_name,c.shop_name]
end
end
report.rewind
send_data(report.read,:type=>'text/csv;charset=iso-8859-1;',:filename=>'report.csv',
:disposition =>'attachment', :encoding => 'utf8')
end 


	#Method:update
	  def update
	      @license = License.find(params[:id])	 
	      @license.modified_by = 1

	      if @license.update_attributes(params[:license])
		 redirect_to :action => 'show', :id => @license
	      else
		@licensetype = Licensetype.find(:all)	#Show All Licensetype
		@ward = Ward.find(:all)
		@street = Street.find(:all)	
		 render :action => 'edit'
	      end
	   end
	#End:update

	#Method:calculate --- Method calculate the license tax (model License)
	def calculate
	#TODO Need to improve more with arrers
		
		@licensetype = Licensetype.find(:all)	#Show All Licensetype	
		@license     = License.find(params[:id])
	end
	#End:create

	#Method:updateinvoice -- Which update the table with License
	def updateinvoice
		 @license = License.find(params[:id])	    	
	     	 @license.modified_by = 1

		if @license.update_attributes(params[:license])
			flash[:notice] = 'License Amount Record successfully Updated.'
			redirect_to :action => 'showinvoice', :id => @license
		else
			render :action => 'calculate'
		end
	end 
	#End:updateinvoice

	#Method:showinvoice -- Which show generated invoice
	def showinvoice
		@license = License.find(params[:id])		
		@license.update_attributes(params[:license])
	end
	#End:showinvoice


	#Method:delete
	def delete
		License.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete
	

	#method: search
	def search
		@query = params[:query]
		@licenses = License.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

#method: Report Generation
	def licensereport
		@licenses = License.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "licensereport.pdf", :type => 'application/pdf')
	end
	#End:report
end
