class XrfCocsController < ApplicationController
  before_action :set_xrf_coc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def reload
    puts params.inspect 

    @xrf_coc = XrfCoc.find(params[:id])
    @positive_lead_reports = LeadReport.all.to_a
    @positive_lead_reports.delete_if{|cur| cur.xrf_coc_id != @xrf_coc.id}

    @negative_lead_reports = LeadReportNeg.all.to_a
    @negative_lead_reports.delete_if{|cur| cur.xrf_coc_id != @xrf_coc.id}

    @lead_positive = LeadReport.all 
    @lead_negative = LeadReportNeg.all 
    @jobs = Job.all

    respond_to do |format|
      format.js 
    end
  end

  # GET /xrf_cocs
  # GET /xrf_cocs.json
  def index
    @xrf_cocs = XrfCoc.all
  end

  # GET /xrf_cocs/1
  # GET /xrf_cocs/1.json
  def show
    initialize_tabs

    @xrf_coc_sample = XrfCocSample.new
    set_sample

    @material_selected = @material.first
    @color_selected = @color.first
    @condition_selected = @condition.first
    @category_selected = @category.first

    @job = @xrf_coc.job

    @positive_lead_reports = LeadReport.all.to_a
    @positive_lead_reports.delete_if{|cur| cur.xrf_coc_id != @xrf_coc.id}
    @negative_lead_reports = LeadReportNeg.all.to_a
    @negative_lead_reports.delete_if{|cur| cur.xrf_coc_id != @xrf_coc.id}
  end

  # GET /xrf_cocs/new
  def new
    @xrf_coc = XrfCoc.new
    @xrf_coc.date = Time.now
    @xrf_coc.job_type = params[:job_type]
    @xrf_coc.cli_type = params[:cli_type]
    @xrf_coc.job_id = params[:job_id]
    

    @job = Job.find(params[:job_id])

    @turnaround = TurnAroundTime.all
    temp = []
    @turnaround.each do | cur |
      temp.push([cur.turntime, cur.turntime])
    end
    @turnaround = temp
    
    @xrf_unit = [ ["RMD LPA-1","RMD LPA-1"], ["Heuresis Pb200i","Heuresis Pb200i"] ]
    @xrf_mode = [ ["Standard","Standard"], ["Quick","Quick"], ["Time Corrected","Time Corrected"] ]
    @action_level = [ ["0.5","0.5"], ["0.6","0.6"], ["0.7","0.7"], ["0.8","0.8"], ["0.9","0.9"], ["1.0", "1.0"] ]
    @abatement_level = [ ["0.5","0.5"], ["0.6","0.6"], ["0.7","0.7"], ["0.8","0.8"], ["0.9","0.9"], ["1.0", "1.0"] ]

    initialize_tabs
  end

  # GET /xrf_cocs/1/edit
  def edit
  end

  # POST /xrf_cocs
  # POST /xrf_cocs.json
  def create
    @xrf_coc = XrfCoc.new(xrf_coc_params)
    @xrf_coc.date = Time.now

    respond_to do |format|
      if @xrf_coc.save
        # format.html { redirect_to @xrf_coc, notice: 'Xrf coc was successfully created.' }
        format.html { redirect_to xrf_coc_path(@xrf_coc) }
        format.json { render :show, status: :created, location: @xrf_coc }
      else
        format.html { render :new }
        format.json { render json: @xrf_coc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xrf_cocs/1
  # PATCH/PUT /xrf_cocs/1.json
  def update
    respond_to do |format|
      if @xrf_coc.update(xrf_coc_params)
        format.html { redirect_to @xrf_coc, notice: 'Xrf coc was successfully updated.' }
        format.json { render :show, status: :ok, location: @xrf_coc }
      else
        format.html { render :edit }
        format.json { render json: @xrf_coc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xrf_cocs/1
  # DELETE /xrf_cocs/1.json
  def destroy
    @xrf_coc.destroy
    respond_to do |format|
      format.html { redirect_to xrf_cocs_url, notice: 'Xrf coc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xrf_coc
      @xrf_coc = XrfCoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xrf_coc_params
      params.require(:xrf_coc).permit(:date, :turnaround, :xrfunit, :xrfmode, :actionlevel, :abatementlevel, :job_id, :user_id, :job_type, :cli_type)
    end

  def set_states
    @states = [ ["Alabama","AL"],       ["Alaska","AK"],      ["Arizona","AZ"],         ["Arkansas","AR"],      ["California","CA"], 
                ["Colorado","CO"],      ["Connecticut","CT"], ["Delaware", "DE"],       ["Florida","FL"],       ["Georgia","GA"],
                ["Hawaii","HI"],        ["Idaho","ID"],       ["Illinois","IL"],        ["Indiana", "IN"],      ["Iowa", "IA"], 
                ["Kansas","KS"],        ["Kentucky","KY"],    ["Louisana","LA"],        ["Maine","ME"],         ["Maryland","MD"], 
                ["Massachusetts","MA"], ["Michigan","MI"],    ["Minnesota","MN"],       ["Mississippi","MS"],   ["Missouri","MO"], 
                ["Montana","MT"],       ["Nebraska","NB"],    ["Nevada","NV"],          ["New Hampshire","NH"], ["New Jersey","NJ"], 
                ["New Mexico","NM"],    ["New York","NY"],    ["North Carolina","NC"],  ["North Dakota","ND"],  ["Ohio","OH"], 
                ["Oklahoma","OK"],      ["Oregon","OG"],      ["Pennsylvania","PA"],    ["Rhode Island","RI"],  ["South Carolina","SC"], 
                ["South Dakota","SD"],  ["Tennessee","TN"],   ["Texas","TX"],           ["Utah","UT"],          ["Vermont","VT"], 
                ["Virginia","VA"],      ["Washingont","WA"],  ["West Virginia","WV"],   ["Wisconsin","WI"],     ["Wyoming","WY"] ]
  end

  def set_sample
      @sample_number = @xrf_coc.job.jobsite[:street].split[0] + "-" + (@xrf_coc.xrf_coc_samples.length + 1).to_s

      @material = [ ["Wood","Wood"], ["Stucco","Stucco"], ["Plaster","Plaster"], ["Sheetrock","Sheetrock"], 
                    ["Metal","Metal"], ["Ceramic","Ceramic"], ["Tile","Tile"], ["Linoleum","Linoleum"] ]
      @color = [ ["White","White"], ["Off White","Off White"], ["Cream","Cream"], ["Tan","Tan"], ["Brown","Brown"],
                  ["Black","Black"], ["Blue","Blue"], ["Red","Red"], ["Multi","Multi"] ]
      @condition = [ ["Good","Good"], ["Fair","Fair"], ["Poor","Poor"], ["Intact","Intact"], ["Deteriorated","Deteriorated"] ]
      @category = [ ["LOD","LOD"], ["LCM","LCM"], ["LBP","LBP"] ]
  end

  def initialize_tabs
    @jobs = Job.all
    @lead_positive = LeadReport.all 
    @lead_negative = LeadReportNeg.all 

    @company = Company.new
    @company_contact = CompanyContact.new
    @subcontractor = Subcontractor.new
    @subcontractor_contact = SubcontractorContact.new
    @jobsite = Jobsite.new
    @jobsite_contact = JobsiteContact.new

    set_states

    @lead_cocs = XrfCoc.all.to_a
    @mold_cocs = TapeBulkCoc.all.to_a
    @lead_cocs.keep_if { |cur| cur.job.id == @xrf_coc.job.id }
    @mold_cocs.keep_if { |cur| cur.job.id == @xrf_coc.job.id }
  end
end
