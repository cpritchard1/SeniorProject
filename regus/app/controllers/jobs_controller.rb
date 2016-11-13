class JobsController < ApplicationController  
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all

    if params[:search]
      @job = Job.search(params[:search]).first
      if !@job
        redirect_to jobs_path, notice: "No Job matches ID #{params[:search]}"
      else
        redirect_to @job
      end
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
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
    @lead_cocs.keep_if { |cur| cur.job.id == @job.id }
    @mold_cocs.keep_if { |cur| cur.job.id == @job.id }
    
  end

  # GET /jobs/new
  def new
    # @job = Job.new
    @company = Company.new
    @company_contact = CompanyContact.new
    @subcontractor = Subcontractor.new
    @subcontractor_contact = SubcontractorContact.new
    @jobsite = Jobsite.new
    @jobsite_contact = JobsiteContact.new
    set_states
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    set_states

    @job = Job.new(job_params)

    @company = Company.new(
                    id: params[:job][:company][:id],
                    name: params[:job][:company][:name],
                    phone: params[:job][:company][:phone],
                    street: params[:job][:company][:street],
                    city: params[:job][:company][:city],
                    state: params[:job][:company][:state],
                    zip: params[:job][:company][:zip],
                    email: params[:job][:company][:email],
                    website: params[:job][:company][:website]
                    )


    @company_contact = CompanyContact.new(
                    id: params[:job][:company_contact][:id],
                    name: params[:job][:company_contact][:name],
                    phone: params[:job][:company_contact][:phone],
                    email: params[:job][:company_contact][:email]
                    )

    @subcontractor = Subcontractor.new(
                    id: params[:job][:subcontractor][:id],
                    name: params[:job][:subcontractor][:name],
                    phone: params[:job][:subcontractor][:phone],
                    street: params[:job][:subcontractor][:street],
                    city: params[:job][:subcontractor][:city],
                    state: params[:job][:subcontractor][:state],
                    zip: params[:job][:subcontractor][:zip],
                    email: params[:job][:subcontractor][:email],
                    website: params[:job][:subcontractor][:website]
                    )

    @subcontractor_contact = SubcontractorContact.new(
                    id: params[:job][:subcontractor_contact][:id],
                    name: params[:job][:subcontractor_contact][:name],
                    phone: params[:job][:subcontractor_contact][:phone],
                    email: params[:job][:subcontractor_contact][:email]
                    )
    @jobsite = Jobsite.new(
                    id: params[:job][:jobsite][:id],
                    name: params[:job][:jobsite][:name],
                    street: params[:job][:jobsite][:street],
                    city: params[:job][:jobsite][:city],
                    state: params[:job][:jobsite][:state],
                    zip: params[:job][:jobsite][:zip],
                    full_address: params[:job][:jobsite][:street] + ',' +
                                  params[:job][:jobsite][:city] + ',' +
                                  params[:job][:jobsite][:state] + ',' +
                                  params[:job][:jobsite][:zip]
                    )

    @jobsite_contact = JobsiteContact.new(
                    id: params[:job][:jobsite_contact][:id],
                    name: params[:job][:jobsite_contact][:name],
                    phone: params[:job][:jobsite_contact][:phone],
                    email: params[:job][:jobsite_contact][:email]
                    )

    @status = true

    if params[:job][:company][:id].present?
      @job.company_id = @company.id
    elsif @company.save
      @job.company_id = @company.id
    else
      @status = false
    end

    if params[:job][:company_contact][:id].present?
      @job.company_contact_id = @company_contact.id
    elsif @company_contact.save
      @job.company_contact_id = @company_contact.id
    else
      @status = false
    end

    if params[:job][:subcontractor][:id].present?
      @job.subcontractor_id = @subcontractor.id
    elsif @subcontractor.save
      @job.subcontractor_id = @subcontractor.id 
    else
      @status = false
    end

    if params[:job][:subcontractor_contact][:id].present?
      @job.subcontractor_contact_id = @subcontractor_contact.id
    elsif @subcontractor_contact.save
      @job.subcontractor_contact_id = @subcontractor_contact.id 
    else
      @status = false
    end

    if params[:job][:jobsite][:id].present?
      @job.jobsite_id = @jobsite.id
    elsif @jobsite.save
      @job.jobsite_id = @jobsite.id
    else
      @status = false
    end

    if params[:job][:jobsite_contact][:id].present?
      @job.jobsite_contact_id = @jobsite_contact.id
    elsif @jobsite_contact.save
      @job.jobsite_contact_id = @jobsite_contact.id
    else
      @status = false
    end

    if @status

      respond_to do |format|
        if @job.save
          format.html { redirect_to @job, notice: 'Job was successfully created.' }
          # format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update    
    create # needed to call create, because submitting a new job from a different controller view
           # was making a call to update instead of create

    # respond_to do |format|
    #   if @job.update(job_params)
    #     format.html { redirect_to @job, notice: 'Job was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @job }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @job.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:date, :user_id, :company_id, :subcontractor_id, :jobsite_id)
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
