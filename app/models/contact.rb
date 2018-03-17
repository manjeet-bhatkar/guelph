class Contact < ApplicationRecord
	has_many :donations

	# validations
	validates_presence_of :first_name, :last_name, :phone, :email
	validates :phone, numericality: true

	def full_name
		[first_name, last_name].join(' ')
	end
end
