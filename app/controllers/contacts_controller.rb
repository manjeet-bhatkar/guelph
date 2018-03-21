class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout

  def resolve_layout
    if admin_signed_in?
      "application"
    else
      "donation"
    end
  end

  # GET /contacts
  # GET /contacts.json
  def index
    if params[:term]
      @contacts = Contact.kinda_spelled_like(params[:term])
    else
      @contacts = Contact.all
    end
    respond_to do |format|
      format.json
      format.html
    end
    print("Contact count #{@contacts.count}")
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        if admin_signed_in?
          format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        else
          format.html { redirect_to new_donation_path, notice: 'Contact was successfully created.' }
        end
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :phone, :email, :address, :middle_name, :is_life_member, :member_since, :phone_type, :year_since_in_guelph)
    end
end
