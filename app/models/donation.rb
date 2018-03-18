class Donation < ApplicationRecord
	belongs_to :contact
	belongs_to :payment_purpose
	belongs_to :payment_mode
	validates_presence_of :contact_id, :amount, :payment_purpose, :payment_mode
	validates :amount, numericality: true

	# scopes
	scope :for_today, lambda { where(donation_date: Date.today).order('amount DESC')  }
	scope :for_date_range, lambda { |from, to| where("donation_date >= ? and donation_date <= ?", from, to) }
	scope :for_year, lambda { |year| for_date_range("#{year}-01-01", "#{year}-12-31").order('amount DESC') }
	scope :for_current_month, lambda { for_date_range(Date.today.beginning_of_month, Date.today) }
	scope :for_last_month, lambda { |date=Date.today.last_month| for_date_range(date.beginning_of_month, date.end_of_month) }
	scope :for_year_to_date, lambda { |date=Date.today| for_date_range(date.beginning_of_year, date) }
	scope :for_current_week, lambda { |date=Date.today| for_date_range(date.beginning_of_week, date.end_of_week)}
end
