class StructurefactorController < ApplicationController

	#Method: new
	def new
		@structurefactor = Structurefactor.new
	end
	#end:new

	#Method: create
	def create
		@structurefactor = Structurefactor.new(params[:structurefactor])
		@structurefactor.created_by = 1
		@structurefactor.modified_by = 1
	
		if @structurefactor.save
			flash.now[:notice] = 'Structure Factor successfully created.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end  
	#end:create

	#Method: list
	def list
		@structurefactors = Structurefactor.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @structurefactors }		#Render to XML File
		end

	end
	#end:list

	#Method: show
	def show
		@structurefactor = Structurefactor.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @structurefactors }		#Render to XML File
		end
	end
	#end:show

	#Method: edit
	def edit
		@structurefactor = Structurefactor.find(params[:id])
	end
	#end:edit

	#Method: update
	def update
		@structurefactor = Structurefactor.find(params[:id])
		@structurefactor.modified_by = 1
	
		if @structurefactor.update_attributes(params[:structurefactor])
			flash.now[:notice] = 'Structure Factor successfully Updated.'
			redirect_to :action => 'show', :id => @structurefactor
		else
			render :action => 'edit'
		end
	end
	#end:update

	#Method: Delete
	def delete
		Structurefactor.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#end:delete

	#Method:search
	def search		
		 @query = params[:query]
		 @structurefactors = Structurefactor.search @query, :page => params[:page], :per_page => 10		
	end	
	#End:search

end
