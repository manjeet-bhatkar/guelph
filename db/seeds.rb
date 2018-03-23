# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

purposes = ['Prashad', 'Ardas', 'Building fund', 'Langar', 'Other']
PaymentPurpose.update_all(active: false)
purposes.each do |p|
	record = PaymentPurpose.find_by_name(p)
	if record.present?
		record.update(active: true)
	else
		PaymentPurpose.create(name: p, active: true)
	end
end

modes = ['Debit card', 'Credit card', 'Cash', 'Cheque']
PaymentMode.update_all(active: false)
modes.each do |p|
	record = PaymentMode.find_by_name(p)
	if record.present?
		record.update(active: true)
	else
		PaymentMode.create(name: p, active: true) 
	end
end

events = ['Regular', 'Gurpurab', 'Wedding', 'Funeral', 'Nagar Kirtan', 'Festival', 'Other']
Event.update_all(active: false)
events.each do |p|
	record = Event.find_by_name(p)
	if record.present?
		record.update(active: true)
	else
		Event.create(name: p, active: true) 
	end
end

currencies = ['USD', 'CAD']
Currency.update_all(active: false)
currencies.each do |p|
	record = Currency.find_by_name(p)
	if record.present?
		record.update(active: true)
	else
		Currency.create(name: p, active: true) 
	end
end
