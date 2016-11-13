class TapeBulkCocSamplesController < ApplicationController
  before_action :set_tape_bulk_coc_sample, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tape_bulk_coc_samples
  # GET /tape_bulk_coc_samples.json
  def index
    @tape_bulk_coc_samples = TapeBulkCocSample.all
  end

  # GET /tape_bulk_coc_samples/1
  # GET /tape_bulk_coc_samples/1.json
  def show
  end

  # GET /tape_bulk_coc_samples/new
  def new
  end

  # GET /tape_bulk_coc_samples/1/edit
  def edit
  end

  # POST /tape_bulk_coc_samples
  # POST /tape_bulk_coc_samples.json
  def create
    @tape_bulk_coc_sample = TapeBulkCocSample.new(tape_bulk_coc_sample_params)
    @tape_bulk_coc = TapeBulkCoc.find(params[:tape_bulk_coc_sample][:tape_bulk_coc_id])
    @collection_types = [["Tape Lift","Tape Lift"], ["Bulk","Bulk"]]
    @collection_selected = params[:tape_bulk_coc_sample][:collection_type]

    respond_to do |format|
      if @tape_bulk_coc_sample.save
        format.html { redirect_to tape_bulk_coc_path(@tape_bulk_coc_sample.tape_bulk_coc), notice: 'Tape bulk coc sample was successfully created.' }
        format.json { render :show, status: :created, location: @tape_bulk_coc_sample }

        @job = @tape_bulk_coc.job
        @lead_cocs = XrfCoc.all.to_a
        @mold_cocs = TapeBulkCoc.all.to_a
        @lead_cocs.keep_if { |cur| cur.job.id == @tape_bulk_coc.job.id }
        @mold_cocs.keep_if { |cur| cur.job.id == @tape_bulk_coc.job.id }

        @tape_bulk_coc = @tape_bulk_coc_sample.tape_bulk_coc
        @sample_number = @tape_bulk_coc.job.jobsite[:street].split[0] + "-" + (@tape_bulk_coc.tape_bulk_coc_samples.length + 1).to_s
        @tape_bulk_coc_sample = TapeBulkCocSample.new
        @notice = "Sample was successfully saved"
        format.js
      else
        format.html { render :new }
        format.json { render json: @tape_bulk_coc_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tape_bulk_coc_samples/1
  # PATCH/PUT /tape_bulk_coc_samples/1.json
  def update
    respond_to do |format|
      if @tape_bulk_coc_sample.update(tape_bulk_coc_sample_params)
        format.html { redirect_to @tape_bulk_coc_sample, notice: 'Tape bulk coc sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @tape_bulk_coc_sample }
      else
        format.html { render :edit }
        format.json { render json: @tape_bulk_coc_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tape_bulk_coc_samples/1
  # DELETE /tape_bulk_coc_samples/1.json
  def destroy
    @tape_bulk_coc_sample.destroy
    respond_to do |format|
      format.html { redirect_to tape_bulk_coc_samples_url, notice: 'Tape bulk coc sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tape_bulk_coc_sample
      @tape_bulk_coc_sample = TapeBulkCocSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tape_bulk_coc_sample_params
      params.require(:tape_bulk_coc_sample).permit(:sample_num, :location, :collection_type, :tape_bulk_coc_id)
    end
end
