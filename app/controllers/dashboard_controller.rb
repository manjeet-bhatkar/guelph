class DashboardController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@todays = Donation.where(donation_date: Date.today)
  end
end
