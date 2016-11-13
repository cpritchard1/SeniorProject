class JobsiteContactsController < ApplicationController
  autocomplete :jobsite_contact, :name, :extra_data => [:phone, :email]

  before_action :set_jobsite_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /jobsite_contacts
  # GET /jobsite_contacts.json
  def index
    @jobsite_contacts = JobsiteContact.all
  end

  # GET /jobsite_contacts/1
  # GET /jobsite_contacts/1.json
  def show
  end

  # GET /jobsite_contacts/new
  def new
    @jobsite_contact = JobsiteContact.new
  end

  # GET /jobsite_contacts/1/edit
  def edit
  end

  # POST /jobsite_contacts
  # POST /jobsite_contacts.json
  def create
    @jobsite_contact = JobsiteContact.new(jobsite_contact_params)

    respond_to do |format|
      if @jobsite_contact.save
        format.html { redirect_to @jobsite_contact, notice: 'Jobsite contact was successfully created.' }
        format.json { render :show, status: :created, location: @jobsite_contact }
      else
        format.html { render :new }
        format.json { render json: @jobsite_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobsite_contacts/1
  # PATCH/PUT /jobsite_contacts/1.json
  def update
    respond_to do |format|
      if @jobsite_contact.update(jobsite_contact_params)
        format.html { redirect_to @jobsite_contact, notice: 'Jobsite contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobsite_contact }
      else
        format.html { render :edit }
        format.json { render json: @jobsite_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobsite_contacts/1
  # DELETE /jobsite_contacts/1.json
  def destroy
    @jobsite_contact.destroy
    respond_to do |format|
      format.html { redirect_to jobsite_contacts_url, notice: 'Jobsite contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobsite_contact
      @jobsite_contact = JobsiteContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobsite_contact_params
      params.require(:jobsite_contact).permit(:name, :phone, :email, :jobsite_id)
    end
end
