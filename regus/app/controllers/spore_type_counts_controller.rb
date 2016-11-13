class SporeTypeCountsController < ApplicationController
  before_action :set_spore_type_count, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /spore_type_counts
  # GET /spore_type_counts.json
  def index
    @spore_type_counts = SporeTypeCount.all
  end

  # GET /spore_type_counts/1
  # GET /spore_type_counts/1.json
  def show
  end

  # GET /spore_type_counts/new
  def new
    @spore_type_count = SporeTypeCount.new
    @tape_bulk_sample_id = params[:tape_bulk_coc_sample_id]
    @tape_bulk_coc_sample = TapeBulkCocSample.find(params[:tape_bulk_coc_sample_id])
    @category_count = [["Rare: 1 to 10","Rare: 1 to 10"], ["Low: 11 to 100","Low: 11 to 100"], ["Medium: 101 to 1000","Medium: 101 to 1000"], ["High: > 1000","High: > 1000"]]
  
    respond_to do |format|
      format.js
    end
  end

  # GET /spore_type_counts/1/edit
  def edit
  end

  # POST /spore_type_counts
  # POST /spore_type_counts.json
  def create
    @spore_type_count = SporeTypeCount.new(spore_type_count_params)

    @category_count = [["Rare: 1 to 10","Rare: 1 to 10"], ["Low: 11 to 100","Low: 11 to 100"], ["Medium: 101 to 1000","Medium: 101 to 1000"], ["High: > 1000","High: > 1000"]] 
    @tape_bulk_coc = @spore_type_count.tape_bulk_coc_sample.tape_bulk_coc

    respond_to do |format|
      if @spore_type_count.save
        format.html { redirect_to tape_bulk_coc_path(@spore_type_count.tape_bulk_coc_sample.tape_bulk_coc), notice: 'Spore type count was successfully created.' }
        format.json { render :show, status: :created, location: @spore_type_count }
        format.js
      else
        format.html { render :new }
        format.json { render json: @spore_type_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spore_type_counts/1
  # PATCH/PUT /spore_type_counts/1.json
  def update
    respond_to do |format|
      if @spore_type_count.update(spore_type_count_params)
        format.html { redirect_to @spore_type_count, notice: 'Spore type count was successfully updated.' }
        format.json { render :show, status: :ok, location: @spore_type_count }
      else
        format.html { render :edit }
        format.json { render json: @spore_type_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spore_type_counts/1
  # DELETE /spore_type_counts/1.json
  def destroy
    @spore_type_count.destroy
    respond_to do |format|
      format.html { redirect_to spore_type_counts_url, notice: 'Spore type count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spore_type_count
        @spore_type_count = SporeTypeCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spore_type_count_params
      params.require(:spore_type_count).permit(:agrocybe, :alternaria, :ascospores, :aspergillus, :aureobasidium, :basidiospores, :bipolaris, :botrytis, :chaetomium, :cercospora, :cladosporium, :curvularia, :epicoccum, :fusarium, :myxomycetes, :nigrospora, :oidium, :pithomyces, :pithomyces, :pollen, :rust, :spegazzina, :stachybotrys, :torula, :tetraploa, :ulocladium, :unidentifiable, :fibrous, :hyphal, :insect, :tape_bulk_coc_sample_id)
    end
end
