#Author: Chaitanya
#Controller: Genders
#=================================
class GenderController < ApplicationController
	require 'csv'
def csvfile
@genders=Gender.find(:all)
report = StringIO.new
CSV::Writer.generate(report, ',') do |title|
title << ['Id','Name' 'Descriptin']
@users.each do |c|
title << [c.id,c.name,c.description]
end
end
report.rewind
send_data(report.read,:type=>'text/csv;charset=iso-8859-1;',:filename=>'report.csv',
:disposition =>'attachment', :encoding => 'utf8')
end 



         #Method:new
	def new
		@gender = Gender.new
	end
	#End:new

	#Method:create
	def create
		@gender = Gender.new(params[:gender])
		@gender.created_by = 1
		@gender.modified_by = 1

		if @gender.save
			flash[:notice] = 'Gender Created Sucessfully.'
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end
	#End:create

	#Method:list
	def list
		@genders = Gender.paginate :page => params[:page], :per_page => 10
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @genders }		#Render to XML File
		end
	end
	#End:list

	#Method:show
	def show
		@gender = Gender.find(params[:id])
		respond_to do |format|		
			format.html 
			format.xml  { render :xml => @genders }		#Render to XML File
		end
	end
	#End:show

	#Method:edit
	def edit
		@gender = Gender.find(params[:id])
	end
	#End:edit

	#Method:update
	def update
		@gender = Gender.find(params[:id])
	
		@gender.modified_by = 1
	
		if @gender.update_attributes(params[:gender])
			flash[:notice] = 'Gender Updated Sucessfully.'
			redirect_to :action => 'show', :id => @gender
		else
		render :action => 'edit'
		end
	end
	#End:update

	#Method: Delete
	def delete
		Gender.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	#End:delete

	#method: search
	def search
		@query = params[:query]
		@genders = Gender.search @query, :page => params[:page], :per_page => 10
	end
	#End Method: search
end
