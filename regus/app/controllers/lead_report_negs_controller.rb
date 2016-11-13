class LeadReportNegsController < ApplicationController
  before_action :set_lead_report_neg, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /lead_report_negs
  # GET /lead_report_negs.json
  def index
    @lead_report_negs = LeadReportNeg.all
  end

  # GET /lead_report_negs/1
  # GET /lead_report_negs/1.json
  def show
  end

  # GET /lead_report_negs/new
  def new
    @lead_report_neg = LeadReportNeg.new

    @coc = XrfCoc.find(params[:xrf_coc_id])
    @job = @coc.cli_type.job_type.job
    @lead_report_neg.xrf_coc_id = @coc.id 
    @lead_report_neg.date = Time.now
    @lead_report_neg.company = @job.company.name
    @lead_report_neg.contact = @job.jobsite_contact.name
    @lead_report_neg.address = @job.company.street + ', ' + @job.company.city + ', ' + @job.company.state + ' ' + @job.company.zip 
    @lead_report_neg.service = @coc.cli_type.clitype + ' ' + @coc.cli_type.job_type.job_type
    @lead_report_neg.instrument = @coc.xrfunit
    @lead_report_neg.jobsite_name = @job.jobsite.name 
    @lead_report_neg.jobsite_addr = @job.jobsite.street + ', ' + @job.jobsite.city + ', ' + @job.jobsite.state + ' ' + @job.jobsite.zip
    @lead_report_neg.consultant = @job.user.fname + ' ' + @job.user.lname 
    @lead_report_neg.cac = "CAC #13-5082"
    @lead_report_neg.cdph = "CDPH #24356"
    @lead_report_neg.nv = "NV #IM1131"

    @lead_report_neg.purpose = LeadReportNegative.all.first.purpose
    @lead_report_neg.analytics = LeadReportNegative.all.first.analytics
    @lead_report_neg.results = LeadReportNegative.all.first.results
    @lead_report_neg.assumptions = LeadReportNegative.all.first.assumptions
  end

  # GET /lead_report_negs/1/edit
  def edit
  end

  # POST /lead_report_negs
  # POST /lead_report_negs.json
  def create
    @lead_report_neg = LeadReportNeg.new(lead_report_neg_params)
    LeadReportNegative.all.first.update(purpose: params[:lead_report_neg][:purpose])
    LeadReportNegative.all.first.update(analytics: params[:lead_report_neg][:analytics])
    LeadReportNegative.all.first.update(results: params[:lead_report_neg][:results])
    LeadReportNegative.all.first.update(assumptions: params[:lead_report_neg][:assumptions])

      if @lead_report_neg.save
        redirect_to lead_report_neg_path(@lead_report_neg, :format=>'pdf', :target=>"_blank")
      else
        render :new
      end
  end

  # PATCH/PUT /lead_report_negs/1
  # PATCH/PUT /lead_report_negs/1.json
  def update
    respond_to do |format|
      if @lead_report_neg.update(lead_report_neg_params)
        format.html { redirect_to @lead_report_neg, notice: 'Lead report neg was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead_report_neg }
      else
        format.html { render :edit }
        format.json { render json: @lead_report_neg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_report_negs/1
  # DELETE /lead_report_negs/1.json
  def destroy
    @lead_report_neg.destroy
    respond_to do |format|
      format.html { redirect_to lead_report_negs_url, notice: 'Lead report neg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_report_neg
      @lead_report_neg = LeadReportNeg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_report_neg_params
      params.require(:lead_report_neg).permit(:date, :company, :contact, :address, :service, :instrument, :jobsite_name, :jobsite_addr, :consultant, :purpose, :analytics, :results, :assumptions, :cac, :cdph, :nv, :xrf_coc_id)
    end
end
