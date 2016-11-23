class XrfCocSamplesController < ApplicationController
  before_action :set_xrf_coc_sample, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /xrf_coc_samples
  # GET /xrf_coc_samples.json
  def index
    @xrf_coc_samples = XrfCocSample.all
  end

  # GET /xrf_coc_samples/1
  # GET /xrf_coc_samples/1.json
  def show
  end

  # GET /xrf_coc_samples/new
  def new
  end

  # GET /xrf_coc_samples/1/edit
  def edit
  end

  # POST /xrf_coc_samples
  # POST /xrf_coc_samples.json
  def create
    @xrf_coc_sample = XrfCocSample.new(xrf_coc_sample_params)
    @xrf_coc = XrfCoc.find(params[:xrf_coc_sample][:xrf_coc_id])
    @material_selected = params[:xrf_coc_sample][:material]
    @color_selected = params[:xrf_coc_sample][:color]
    @condition_selected = params[:xrf_coc_sample][:condition]
    @category_selected = params[:xrf_coc_sample][:category]
    set_sample

    respond_to do |format|
      if @xrf_coc_sample.save
        format.html { redirect_to xrf_coc_path(@xrf_coc_sample.xrf_coc), notice: 'Xrf coc sample was successfully created.' }
        format.json { render :show, status: :created, location: @xrf_coc_sample }

        @job = @xrf_coc.job
        @lead_cocs = XrfCoc.all.to_a
        @mold_cocs = TapeBulkCoc.all.to_a
        @mycometer_cocs = MycometerCoc.all.to_a
        @lead_cocs.keep_if { |cur| cur.job.id == @xrf_coc.job.id }
        @mold_cocs.keep_if { |cur| cur.job.id == @xrf_coc.job.id }
        @mycometer_cocs.keep_if { |cur| cur.job.id == @xrf_coc.job.id }
        @sample_number = @xrf_coc.job.jobsite[:street].split[0] + "-" + (@xrf_coc.xrf_coc_samples.count + 1).to_s
        @xrf_coc_sample = XrfCocSample.new
        @notice = "Sample was successfully saved"
        format.js
      else
        format.html { render :new }
        format.json { render json: @xrf_coc_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xrf_coc_samples/1
  # PATCH/PUT /xrf_coc_samples/1.json
  def update
    respond_to do |format|
      if @xrf_coc_sample.update(xrf_coc_sample_params)
        format.html { redirect_to @xrf_coc_sample, notice: 'Xrf coc sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @xrf_coc_sample }
      else
        format.html { render :edit }
        format.json { render json: @xrf_coc_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xrf_coc_samples/1
  # DELETE /xrf_coc_samples/1.json
  def destroy
    @xrf_coc_sample.destroy
    respond_to do |format|
      format.html { redirect_to xrf_coc_samples_url, notice: 'Xrf coc sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xrf_coc_sample
      @xrf_coc_sample = XrfCocSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xrf_coc_sample_params
      params.require(:xrf_coc_sample).permit(:sample_num, :location, :material, :color, :condition, :reading, :category, :xrf_coc_id)
    end
end

def set_sample
    # @sample_number = @xrf_coc.cli_type.job_type.job.jobsite[:street].split[0] + "-" + (@xrf_coc.xrf_coc_samples.length + 1).to_s

    @material = [ ["Wood","Wood"], ["Stucco","Stucco"], ["Plaster","Plaster"], ["Sheetrock","Sheetrock"], 
                  ["Metal","Metal"], ["Ceramic","Ceramic"], ["Tile","Tile"], ["Linoleum","Linoleum"] ]
    @color = [ ["White","White"], ["Off White","Off White"], ["Cream","Cream"], ["Tan","Tan"], ["Brown","Brown"],
                ["Black","Black"], ["Blue","Blue"], ["Red","Red"], ["Multi","Multi"] ]
    @condition = [ ["Good","Good"], ["Fair","Fair"], ["Poor","Poor"], ["Intact","Intact"], ["Deteriorated","Deteriorated"] ]
    @category = [ ["LOD","LOD"], ["LCM","LCM"], ["LBP","LBP"] ]
end
