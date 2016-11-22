class MycometerCocSamplesController < ApplicationController
  before_action :set_mycometer_coc_sample, only: [:show, :edit, :update, :destroy]

  # GET /mycometer_coc_samples
  # GET /mycometer_coc_samples.json
  def index
    @mycometer_coc_samples = MycometerCocSample.all
  end

  # GET /mycometer_coc_samples/1
  # GET /mycometer_coc_samples/1.json
  def show
  end

  # GET /mycometer_coc_samples/new
  def new
    @mycometer_coc_sample = MycometerCocSample.new
  end

  # GET /mycometer_coc_samples/1/edit
  def edit
  end

  # POST /mycometer_coc_samples
  # POST /mycometer_coc_samples.json
  def create
    @mycometer_coc_sample = MycometerCocSample.new(mycometer_coc_sample_params)

    respond_to do |format|
      if @mycometer_coc_sample.save
        format.html { redirect_to @mycometer_coc_sample, notice: 'Mycometer coc sample was successfully created.' }
        format.json { render :show, status: :created, location: @mycometer_coc_sample }

        @job = @mycometer_coc_sample.mycometer_coc.job
        @mycometer_coc = @mycometer_coc_sample.mycometer_coc
        @lead_cocs = XrfCoc.all.to_a
        @mold_cocs = TapeBulkCoc.all.to_a
        @mycometer_cocs = MycometerCoc.all.to_a
        @lead_cocs.keep_if { |cur| cur.job.id == @job.id }
        @mold_cocs.keep_if { |cur| cur.job.id == @job.id }
        @mycometer_cocs.keep_if { |cur| cur.job.id == @job.id }
        @sample_number = @job.jobsite[:street].split[0] + "-" + (@mycometer_coc_sample.mycometer_coc.mycometer_coc_samples.count + 1).to_s
        @mycometer_coc_sample = MycometerCocSample.new
        @notice = "Sample was successfully saved"
        format.js
      else
        format.html { render :new }
        format.json { render json: @mycometer_coc_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mycometer_coc_samples/1
  # PATCH/PUT /mycometer_coc_samples/1.json
  def update
    respond_to do |format|
      if @mycometer_coc_sample.update(mycometer_coc_sample_params)
        format.html { redirect_to @mycometer_coc_sample, notice: 'Mycometer coc sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @mycometer_coc_sample }
      else
        format.html { render :edit }
        format.json { render json: @mycometer_coc_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mycometer_coc_samples/1
  # DELETE /mycometer_coc_samples/1.json
  def destroy
    @mycometer_coc_sample.destroy
    respond_to do |format|
      format.html { redirect_to mycometer_coc_samples_url, notice: 'Mycometer coc sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mycometer_coc_sample
      @mycometer_coc_sample = MycometerCocSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mycometer_coc_sample_params
      params.require(:mycometer_coc_sample).permit(:sample_num, :location, :bv1, :bv2, :cv, :av, :bsv, :result, :mycometer_coc_id)
    end
end
