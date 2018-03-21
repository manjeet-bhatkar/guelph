class Contact < ApplicationRecord
	include PgSearch
	pg_search_scope :kinda_spelled_like, against: [:first_name, :last_name],
									:using => {
                    :trigram => {
                      :threshold => 0.1
                    }
                  }

	has_many :donations

	# validations
	validates_presence_of :first_name, :last_name, :phone
	validates :phone, numericality: true

	enum phone_type: { home: 0, mobile: 1 }

	def full_name
		[first_name, last_name].join(' ')
	end
end
