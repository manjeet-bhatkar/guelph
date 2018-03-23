class Event < ApplicationRecord
	scope :all_active, lambda { where(active: true)  }
end
