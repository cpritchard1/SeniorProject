class TapeBulkCocsController < ApplicationController
  before_action :set_tape_bulk_coc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tape_bulk_cocs
  # GET /tape_bulk_cocs.json
  def index
    @tape_bulk_cocs = TapeBulkCoc.all
  end

  # GET /tape_bulk_cocs/1
  # GET /tape_bulk_cocs/1.json
  def show
    initialize_tabs

    @tape_bulk_coc_sample = TapeBulkCocSample.new
    @sample_number = @tape_bulk_coc.job.jobsite[:street].split[0] + "-" + (@tape_bulk_coc.tape_bulk_coc_samples.length + 1).to_s

    @collection_types = [["Tape Lift","Tape Lift"], ["Bulk","Bulk"]]
    @collection_selected = @collection_types.first

    @spore_type_count = SporeTypeCount.new
    @category_count = [["Rare: 1 to 10","Rare: 1 to 10"], ["Low: 11 to 100","Low: 11 to 100"], ["Medium: 101 to 1000","Medium: 101 to 1000"], ["High: > 1000","High: > 1000"]]

    @job = @tape_bulk_coc.job
  end

  # GET /tape_bulk_cocs/new
  def new
    @tape_bulk_coc = TapeBulkCoc.new
    @tape_bulk_coc.date = Time.now
    @tape_bulk_coc.job_type = params[:job_type]
    @tape_bulk_coc.cli_type = params[:cli_type]
    @tape_bulk_coc.job_id = params[:job_id]

    @job = Job.find(params[:job_id])

    @turnaround = TurnAroundTime.all
    temp = []
    @turnaround.each do | cur |
      temp.push([cur.turntime, cur.turntime])
    end
    @turnaround = temp

    initialize_tabs
    
  end

  # GET /tape_bulk_cocs/1/edit
  def edit
  end

  # POST /tape_bulk_cocs
  # POST /tape_bulk_cocs.json
  def create
    @tape_bulk_coc = TapeBulkCoc.new(tape_bulk_coc_params)

    respond_to do |format|
      if @tape_bulk_coc.save
        # format.html { redirect_to new_tape_bulk_coc_sample_path(tape_bulk_coc_id: @tape_bulk_coc.id), notice: 'Tape bulk swab coc was successfully created.' }
        format.html { redirect_to tape_bulk_coc_path(@tape_bulk_coc) }
        format.json { render :show, status: :created, location: @tape_bulk_coc }
      else
        format.html { render :new }
        format.json { render json: @tape_bulk_coc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tape_bulk_cocs/1
  # PATCH/PUT /tape_bulk_cocs/1.json
  def update
    respond_to do |format|
      if @tape_bulk_coc.update(tape_bulk_coc_params)
        format.html { redirect_to @tape_bulk_coc, notice: 'Tape bulk swab coc was successfully updated.' }
        format.json { render :show, status: :ok, location: @tape_bulk_coc }
      else
        format.html { render :edit }
        format.json { render json: @tape_bulk_coc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tape_bulk_cocs/1
  # DELETE /tape_bulk_cocs/1.json
  def destroy
    @tape_bulk_coc.destroy
    respond_to do |format|
      format.html { redirect_to tape_bulk_cocs_url, notice: 'Tape bulk swab coc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tape_bulk_coc
      @tape_bulk_coc = TapeBulkCoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tape_bulk_coc_params
      params.require(:tape_bulk_coc).permit(:date, :turnaround, :job_id, :user_id, :job_type, :cli_type)
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
    @lead_cocs.keep_if { |cur| cur.job.id == @tape_bulk_coc.job.id }
    @mold_cocs.keep_if { |cur| cur.job.id == @tape_bulk_coc.job.id }
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
end
