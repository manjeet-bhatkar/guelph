module DashboardHelper
	def current_month_name
		Date::MONTHNAMES[Date.today.month]
	end

	def last_month_name
		Date::MONTHNAMES[Date.today.month - 1]
	end

	def month_name(month)
		Date::MONTHNAMES[month]
	end

	def current_year
		Date.today.year
	end

	def current_week_name
		date = Date.today
		start = date.beginning_of_week
		weekend = date.end_of_week
		"#{start.strftime('%d %b %Y')} ~ #{weekend.strftime('%d %b %Y')}"
	end
end
