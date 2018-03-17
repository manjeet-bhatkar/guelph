class ReportsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	if request.post?
  		donation_query = [params[:first_name], params[:last_name], params[:email], params[:phone], params[:amount]]
  		@donations = Donation.where()
  	end
  end
end
