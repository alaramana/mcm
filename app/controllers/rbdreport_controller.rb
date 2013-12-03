class RbdreportController < ApplicationController

	#method:RBD Report
	def list
		@castes = Caste.find(:all) 	#List all Castes
		@religions = Religion.find(:all)				
	end


	def bcastereport
		@births = Birth.find_by_sql(["select * from births where caste_id = ? order by register_id",params[:id]] )

#		@births = Birth.all(:conditions =>
 # ["register_date >= ? AND register_date <= ?", params[:from_date].to_date, params[:end_date].to_date],:order =>"register_id")
   		html = render :layout => false 
		kit = PDFKit.new(html,:orientation => 'Landscape')

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "castereport.pdf", :type => 'application/pdf')

	end


	def dcastereport
		@deaths = Death.find_by_sql(["select * from deaths where caste_id = ? order by register_id",
params[:id]] )

   		html = render :layout => false 
		kit = PDFKit.new(html,:orientation => 'Landscape')

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "dcastereport.pdf", :type => 'application/pdf')

	end

	def sreport

		@bmale = Birth.find_all_by_gender_id (1).count
		@bfemale = Birth.find_all_by_gender_id (2).count
		@dmale = Death.find_all_by_gender_id (1).count
		@dfemale = Death.find_all_by_gender_id (2).count


   		html = render :layout => false 
		kit = PDFKit.new(html)

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "sreport.pdf", :type => 'application/pdf')

	end


	def bdatereport
#		@births = Birth.find_by_sql(["select * from births where caste_id = ? order by register_id",params[:id]] )

		@births = Birth.all(:conditions =>
  ["register_date >= ? AND register_date <= ?", params[:from_date].to_date, params[:end_date].to_date],:order =>"register_id")
   		html = render :layout => false 
		kit = PDFKit.new(html,:orientation => 'Landscape')

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "bdatereport.pdf", :type => 'application/pdf')

	end

	def ddatereport
#		@births = Birth.find_by_sql(["select * from births where caste_id = ? order by register_id",params[:id]] )

		@deaths = Death.all(:conditions =>
  ["register_date >= ? AND register_date <= ?", params[:start_date].to_date, params[:last_date].to_date],:order =>"register_id")
   		
		html = render :layout => false 
		kit = PDFKit.new(html,:orientation => 'Landscape')

		kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

		send_data(kit.to_pdf, :filename => "ddatereport.pdf", :type => 'application/pdf')

	end

end
