class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout

  def resolve_layout
    if admin_signed_in?
      "application"
    else
      "donation"
    end
  end

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new()
    @payment_purposes = PaymentPurpose.all_active
    @events = Event.all_active
    @currencies = Currency.all_active
    @payment_modes = PaymentMode.all_active
    @donation.payment_mode = PaymentMode.first
    @donation.payment_purpose = PaymentPurpose.first
    @donation.currency = @currencies.first
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.donation_date = Date.today()
    @payment_purposes = PaymentPurpose.all_active
    @events = Event.all_active
    @currencies = Currency.all_active
    @payment_modes = PaymentMode.all_active
    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
      @payment_purposes = PaymentPurpose.all_active
      @events = Event.all_active
      @currencies = Currency.all_active
      @payment_modes = PaymentMode.all_active
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:amount, :donation_date, :contact_id, :payment_purpose_id, :payment_mode_id, :currency_id, :event_id, :bank_name, :cheque_number)
    end
end
