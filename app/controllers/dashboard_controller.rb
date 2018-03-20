class DashboardController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@todays = Donation.for_today().limit(5)
  	@top_donations = Donation.for_year(Date.today.year).limit(5)
  	@current_month_donations = Donation.for_current_month.sum(:amount)
  	@last_month_donations = Donation.for_last_month.sum(:amount)
  	@current_year_donations = Donation.for_year_to_date.sum(:amount)
  	@current_week_donations  = Donation.for_current_week.sum(:amount)
		@previous_years = Donation.for_previous_years
  end
end
