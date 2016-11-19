class MycometerCocsController < ApplicationController
  before_action :set_mycometer_coc, only: [:show, :edit, :update, :destroy]

  # GET /mycometer_cocs
  # GET /mycometer_cocs.json
  def index
    @mycometer_cocs = MycometerCoc.all
  end

  # GET /mycometer_cocs/1
  # GET /mycometer_cocs/1.json
  def show
  end

  # GET /mycometer_cocs/new
  def new
    @mycometer_coc = MycometerCoc.new
    @mycometer_coc.date = Time.now
    @mycometer_coc.job_type = params[:job_type]
    @mycometer_coc.cli_type = params[:cli_type]
    @mycometer_coc.job_id = params[:job_id]
    @mycometer_coc.user_id = current_user.id

    @job = @mycometer_coc.job 

    @turnaround = TurnAroundTime.all
    temp = []
    @turnaround.each do | cur |
      temp.push([cur.turntime, cur.turntime])
    end
    @turnaround = temp

    @mold_air = [ ["Baseline", "Baseline"], ["Clearance", "Clearance"] ]
    @building_type = [ ["Mechanically Ventilated", "Mechanically Ventilated"], ["Non Ventilated", "Non Ventilated"] ]
    @sampling_method = [ ["Agressive", "Agressive"], ["Passive", "Passive"] ]
    @test_unit = [ ["Dwyer VFB Visi-Float Flowmeter", "Dwyer VFB Visi-Float Flowmeter"] ]

    # @ambient_temp = [ [64, 64], [65 , 65], [66 , 66], [67 , 67], [68 , 68], [69 , 69], [70 , 70], 
    #                   [71 , 71], [72 , 72], [73 , 73], [74 , 74], [75 , 75], [76 , 76], [77 , 77], [78 , 78], 
    #                   [79 , 79], [80 , 80], [81 , 81], [82 , 82], [83 , 83], [84 , 84], [85 , 85], [86 , 86] ]

    set_degrees
    @ambient_temp = [ [@_64_ , 64], [@_65_ , 65], [@_66_ , 66], [@_67_ , 67], [@_68_ , 68], [@_69_ , 69], [@_70_ , 70], 
                  [@_71_ , 71], [@_72_ , 72], [@_73_ , 73], [@_74_ , 74], [@_75_ , 75], [@_76_ , 76], [@_77_ , 77], [@_78_ , 78], 
                  [@_79_ , 79], [@_80_ , 80], [@_81_ , 81], [@_82_ , 82], [@_83_ , 83], [@_84_ , 84], [@_85_ , 85], [@_86_ , 86] ]
                  
    initialize_tabs
  end

  # GET /mycometer_cocs/1/edit
  def edit
  end

  # POST /mycometer_cocs
  # POST /mycometer_cocs.json
  def create
    @mycometer_coc = MycometerCoc.new(mycometer_coc_params)
x
    respond_to do |format|
      if @mycometer_coc.save
        format.html { redirect_to @mycometer_coc, notice: 'Mycometer coc was successfully created.' }
        format.json { render :show, status: :created, location: @mycometer_coc }
      else
        format.html { render :new }
        format.json { render json: @mycometer_coc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mycometer_cocs/1
  # PATCH/PUT /mycometer_cocs/1.json
  def update
    respond_to do |format|
      if @mycometer_coc.update(mycometer_coc_params)
        format.html { redirect_to @mycometer_coc, notice: 'Mycometer coc was successfully updated.' }
        format.json { render :show, status: :ok, location: @mycometer_coc }
      else
        format.html { render :edit }
        format.json { render json: @mycometer_coc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mycometer_cocs/1
  # DELETE /mycometer_cocs/1.json
  def destroy
    @mycometer_coc.destroy
    respond_to do |format|
      format.html { redirect_to mycometer_cocs_url, notice: 'Mycometer coc was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    @lead_cocs.keep_if { |cur| cur.job.id == @mycometer_coc.job.id }
    @mold_cocs.keep_if { |cur| cur.job.id == @mycometer_coc.job.id }
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

  def set_degrees
    @_64_ = "64 &#8457;".html_safe
    @_65_ = "65 &#8457;".html_safe
    @_66_ = "66 &#8457;".html_safe
    @_67_ = "67 &#8457;".html_safe
    @_68_ = "68 &#8457;".html_safe
    @_69_ = "69 &#8457;".html_safe
    @_70_ = "70 &#8457;".html_safe
    @_71_ = "71 &#8457;".html_safe
    @_72_ = "72 &#8457;".html_safe
    @_73_ = "73 &#8457;".html_safe
    @_74_ = "74 &#8457;".html_safe
    @_75_ = "75 &#8457;".html_safe
    @_76_ = "76 &#8457;".html_safe
    @_77_ = "77 &#8457;".html_safe
    @_78_ = "78 &#8457;".html_safe
    @_79_ = "79 &#8457;".html_safe
    @_80_ = "80 &#8457;".html_safe
    @_81_ = "81 &#8457;".html_safe
    @_82_ = "82 &#8457;".html_safe
    @_83_ = "83 &#8457;".html_safe
    @_84_ = "84 &#8457;".html_safe
    @_85_ = "85 &#8457;".html_safe
    @_86_ = "86 &#8457;".html_safe
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mycometer_coc
      @mycometer_coc = MycometerCoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mycometer_coc_params
      params.require(:mycometer_coc).permit(:date, :turnaround, :mold_air, :building_type, :sampling_method, :ambient_temp, :reaction_time, :liters_minute, :duration, :job_type, :cli_type, :job_id, :user_id)
    end
end
