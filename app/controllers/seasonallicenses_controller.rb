#Author: Krishnaveni
#---------------------
class SeasonallicensesController < ApplicationController
	#Method:new
	   def new
	     @genders = Gender.find(:all) 
	      @seasonallicense = Seasonallicense.new	
	     		    
	   end
	#End:new

	#Method:create
	   def create
	      @seasonallicense = Seasonallicense.new(params[:seasonallicense])

	      @seasonallicense.created_by = 1
	      @seasonallicense.modified_by = 1

	    if @seasonallicense.save
		flash[:notice] = 'Record successfully created.'
	     	redirect_to :action => 'list'

	      else
		   @genders = Gender.find(:all) 			
		    render :action => 'new'
	    end
	    
	    end 
	 # End of create
	
	#Method:list	
	   def list
	     @seasonallicenses = Seasonallicense.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @seasonallicenses }#Render to XML File
		end
	   end
	#End:list

	#Method:show
	 def show
	      @seasonallicense = Seasonallicense.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @seasonallicenses }#Render to XML File
		end
	 end
	#End:show

	#Method:edit
	  def edit
		@genders = Gender.find(:all) 		
	      @seasonallicense = Seasonallicense.find(params[:id])	   
	  end
	#End:edit

	#Method:update
	  def update
	      @seasonallicense = Seasonallicense.find(params[:id])

	      @seasonallicense.created_by = 1
	      @seasonallicense.modified_by = 1

	      if @seasonallicense.update_attributes(params[:seasonallicense])
		 redirect_to :action => 'list'
	      else	
		@genders = Gender.find(:all) 			
		 render :action => 'edit'
	      end
	   end
	#End:update

	#Method:delete
	def delete
		Seasonallicense.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@seasonallicenses = Seasonallicense.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search

#method: Report Generation
	def seasonalreport
		@seasonallicenses = Seasonallicense.find(:all)		
    html = render :layout => false 
	kit = PDFKit.new(html,:orientation => 'Landscape')

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "seasonalreport.pdf", :type => 'application/pdf')
	end
	#End:report

end
