class Currency < ApplicationRecord
	scope :all_active, lambda { where(active: true)  }
end
