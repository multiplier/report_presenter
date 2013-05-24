class ReportsController < ApplicationController
	before_filter :authenticate_user!
	# load_and_authorize_resource
	def index
		@reports = Report.all.decorate
		@num_reports = @reports.count
	end

	def show
		@report =Report.find(params[:id]).decorate
	end

	def new
		@report = Report.new
	end

	def edit
		@report = Report.find(params[:id])
	end

	def create
		@report = Report.new(report_params)
		if @report.save 
			redirect_to @report, notice: 'Report was successfully created.' 
		else  
			render action: "new"
		end
	end

	def update
		@report = Report.find(params[:id])
		if @report.update_attributes(report_params)
			redirect_to @report, notice: 'Report was successfully updated.'
		else
			render action: "edit" 
		end
	end

	def destroy
		@report = Report.find(params[:id])
		@report.destroy
		redirect_to reports_url
	end 

	private
	def report_params
		params[:report][:created_by]=current_user.id
		params[:report][:created_ip]=request.remote_ip
		params[:report][:updated_by]=current_user.id
		params[:report][:updated_ip]=request.remote_ip
		params.require(:report).permit(:title, :short_description, :full_description,:endorser_name, :endorser_title, :endorser_avatar, :endorsement, :status, :start_date, :end_date, :user_id, :created_by, :created_ip, :updated_by, :updated_ip)  
	end
end