module DonationsHelper
	def format_amount(donation)
		"#{donation.currency.blank? ? '' : '('+donation.currency.name+')'} $#{donation.amount}"
	end
end
