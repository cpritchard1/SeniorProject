class CompanyContactsController < ApplicationController
  autocomplete :company_contact, :name, :extra_data => [:phone, :email]
  
  before_action :set_company_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /company_contacts
  # GET /company_contacts.json
  def index
    @company_contacts = CompanyContact.all
  end

  # GET /company_contacts/1
  # GET /company_contacts/1.json
  def show
  end

  # GET /company_contacts/new
  def new
    @company_contact = CompanyContact.new
  end

  # GET /company_contacts/1/edit
  def edit
  end

  # POST /company_contacts
  # POST /company_contacts.json
  def create
    @company_contact = CompanyContact.new(company_contact_params)

    respond_to do |format|
      if @company_contact.save
        format.html { redirect_to @company_contact, notice: 'Company contact was successfully created.' }
        format.json { render :show, status: :created, location: @company_contact }
      else
        format.html { render :new }
        format.json { render json: @company_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_contacts/1
  # PATCH/PUT /company_contacts/1.json
  def update
    respond_to do |format|
      if @company_contact.update(company_contact_params)
        format.html { redirect_to @company_contact, notice: 'Company contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_contact }
      else
        format.html { render :edit }
        format.json { render json: @company_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_contacts/1
  # DELETE /company_contacts/1.json
  def destroy
    @company_contact.destroy
    respond_to do |format|
      format.html { redirect_to company_contacts_url, notice: 'Company contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_contact
      @company_contact = CompanyContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_contact_params
      params.require(:company_contact).permit(:name, :phone, :email, :company_id)
    end
end
