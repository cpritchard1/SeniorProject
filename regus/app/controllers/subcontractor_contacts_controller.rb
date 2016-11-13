class SubcontractorContactsController < ApplicationController
  autocomplete :subcontractor_contact, :name, :extra_data => [:phone, :email]
  
  before_action :set_subcontractor_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /subcontractor_contacts
  # GET /subcontractor_contacts.json
  def index
    @subcontractor_contacts = SubcontractorContact.all
  end

  # GET /subcontractor_contacts/1
  # GET /subcontractor_contacts/1.json
  def show
  end

  # GET /subcontractor_contacts/new
  def new
    @subcontractor_contact = SubcontractorContact.new
  end

  # GET /subcontractor_contacts/1/edit
  def edit
  end

  # POST /subcontractor_contacts
  # POST /subcontractor_contacts.json
  def create
    @subcontractor_contact = SubcontractorContact.new(subcontractor_contact_params)

    respond_to do |format|
      if @subcontractor_contact.save
        format.html { redirect_to @subcontractor_contact, notice: 'Subcontractor contact was successfully created.' }
        format.json { render :show, status: :created, location: @subcontractor_contact }
      else
        format.html { render :new }
        format.json { render json: @subcontractor_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcontractor_contacts/1
  # PATCH/PUT /subcontractor_contacts/1.json
  def update
    respond_to do |format|
      if @subcontractor_contact.update(subcontractor_contact_params)
        format.html { redirect_to @subcontractor_contact, notice: 'Subcontractor contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcontractor_contact }
      else
        format.html { render :edit }
        format.json { render json: @subcontractor_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcontractor_contacts/1
  # DELETE /subcontractor_contacts/1.json
  def destroy
    @subcontractor_contact.destroy
    respond_to do |format|
      format.html { redirect_to subcontractor_contacts_url, notice: 'Subcontractor contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcontractor_contact
      @subcontractor_contact = SubcontractorContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcontractor_contact_params
      params.require(:subcontractor_contact).permit(:name, :phone, :email, :subcontractor_id)
    end
end
