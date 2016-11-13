class LeadReportsController < ApplicationController
  before_action :set_lead_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /lead_reports
  # GET /lead_reports.json
  def index
    @coc = XrfCoc.find(params[:xrf_coc_id])
    @job = @coc.cli_type.job_type.job

    @positive_lead_reports = LeadReport.all.to_a
    @positive_lead_reports.delete_if{|cur| cur.xrf_coc_id.to_s != params[:xrf_coc_id]}

    @negative_lead_reports = LeadReportNeg.all.to_a
    @negative_lead_reports.delete_if{|cur| cur.xrf_coc_id.to_s != params[:xrf_coc_id]}
  end

  # GET /lead_reports/1
  # GET /lead_reports/1.json
  def show
  end

  # GET /lead_reports/new
  def new
    @lead_report = LeadReport.new

    @coc = XrfCoc.find(params[:xrf_coc_id])
    @job = @coc.job
    @lead_report.xrf_coc_id = @coc.id 
    @lead_report.date = Time.now
    @lead_report.company = @job.company.name
    @lead_report.contact = @job.jobsite_contact.name
    @lead_report.address = @job.company.street + ', ' + @job.company.city + ', ' + @job.company.state + ' ' + @job.company.zip 
    @lead_report.service = @coc.cli_type + ' ' + @coc.job_type
    @lead_report.instrument = @coc.xrfunit
    @lead_report.jobsite_name = @job.jobsite.name 
    @lead_report.jobsite_addr = @job.jobsite.street + ', ' + @job.jobsite.city + ', ' + @job.jobsite.state + ' ' + @job.jobsite.zip
    @lead_report.consultant = @job.user.fname + ' ' + @job.user.lname 
    @lead_report.cac = "CAC #13-5082"
    @lead_report.cdph = "CDPH #24356"
    @lead_report.nv = "NV #IM1131"

    @lead_report.purpose = LeadReportPositive.all.first.purpose
    @lead_report.analytics = LeadReportPositive.all.first.analytics
    @lead_report.results = LeadReportPositive.all.first.results
    @lead_report.recommendations = LeadReportPositive.all.first.recommendations
    @lead_report.assumptions = LeadReportPositive.all.first.assumptions
  end

  # GET /lead_reports/1/edit
  def edit
  end

  # POST /lead_reports
  # POST /lead_reports.json
  def create
    @lead_report = LeadReport.new(lead_report_params)
    LeadReportPositive.all.first.update(purpose: params[:lead_report][:purpose])
    LeadReportPositive.all.first.update(analytics: params[:lead_report][:analytics])
    LeadReportPositive.all.first.update(results: params[:lead_report][:results])
    LeadReportPositive.all.first.update(recommendations: params[:lead_report][:recommendations])
    LeadReportPositive.all.first.update(assumptions: params[:lead_report][:assumptions])

    # respond_to do |format|
      if @lead_report.save
        # format.html { redirect_to @lead_report, notice: 'Lead report was successfully created.' }
        # format.json { render :show, status: :created, location: @lead_report }
        redirect_to lead_report_path(@lead_report, :format=>'pdf', :target=>"_blank")
      else
        render :new
        # format.json { render json: @lead_report.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /lead_reports/1
  # PATCH/PUT /lead_reports/1.json
  def update
    # respond_to do |format|
      if @lead_report.update(lead_report_params)
        # format.html { redirect_to @lead_report, notice: 'Lead report was successfully updated.' }
        # format.json { render :show, status: :ok, location: @lead_report }
        redirect_to lead_report_path(@lead_report, :format=>'pdf')
      else
        render :edit
        # format.json { render json: @lead_report.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /lead_reports/1
  # DELETE /lead_reports/1.json
  def destroy
    @lead_report.destroy
    respond_to do |format|
      format.html { redirect_to lead_reports_url, notice: 'Lead report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_report
      @lead_report = LeadReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_report_params
      params.require(:lead_report).permit(:date, :company, :contact, :address, :service, :instrument, :jobsite_name, :jobsite_addr, :consultant, :purpose, :analytics, :results, :recommendations, :assumptions, :cac, :cdph, :nv, :xrf_coc_id)
    end
end
