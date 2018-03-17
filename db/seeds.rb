# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

purposes = ['Prashad', 'Ardas', 'Building fund']

purposes.each do |p|
	PaymentPurpose.create(name: p)
end

modes = ['Cash', 'Online', 'Cheque']

modes.each do |p|
	PaymentMode.create(name: p)
end