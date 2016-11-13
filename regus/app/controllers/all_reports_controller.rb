class AllReportsController < ApplicationController
  before_action :set_all_report, only: [:show, :edit, :update, :destroy]

  # GET /all_reports
  # GET /all_reports.json
  def index
    @all_reports = AllReport.all

    @lead_positive = LeadReport.all 
    @lead_negative = LeadReportNeg.all 
  end

  # GET /all_reports/1
  # GET /all_reports/1.json
  def show
  end

  # GET /all_reports/new
  def new
    @all_report = AllReport.new
  end

  # GET /all_reports/1/edit
  def edit
  end

  # POST /all_reports
  # POST /all_reports.json
  def create
    @all_report = AllReport.new(all_report_params)

    respond_to do |format|
      if @all_report.save
        format.html { redirect_to @all_report, notice: 'All report was successfully created.' }
        format.json { render :show, status: :created, location: @all_report }
      else
        format.html { render :new }
        format.json { render json: @all_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_reports/1
  # PATCH/PUT /all_reports/1.json
  def update
    respond_to do |format|
      if @all_report.update(all_report_params)
        format.html { redirect_to @all_report, notice: 'All report was successfully updated.' }
        format.json { render :show, status: :ok, location: @all_report }
      else
        format.html { render :edit }
        format.json { render json: @all_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_reports/1
  # DELETE /all_reports/1.json
  def destroy
    @all_report.destroy
    respond_to do |format|
      format.html { redirect_to all_reports_url, notice: 'All report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_report
      @all_report = AllReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def all_report_params
      params.fetch(:all_report, {})
    end
end
