# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


###### SAMPLE DATA ######
raph = User.create(first_name: "Raphael", last_name: "Ho", phone: "773-633-3299", gmail: "raph@raph.com")
5.times do 
	raph.supporters << Supporter.create(first_name: Faker::Name.first_name,
										last_name: Faker::Name.last_name,
										phone: Faker::PhoneNumber.cell_phone,
										gmail: Faker::Internet.email)
end