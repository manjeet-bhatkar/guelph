class Donation < ApplicationRecord
	belongs_to :contact
	belongs_to :payment_purpose
	belongs_to :payment_mode
	validates_presence_of :contact_id, :amount, :payment_purpose, :payment_mode
	validates :amount, numericality: true
end
