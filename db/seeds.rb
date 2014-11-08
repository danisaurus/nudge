# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


###### SAMPLE DATA ######
raph = User.create(first_name: "Raphael", last_name: "Ho", phone: "773-633-3299", gmail: "raph@raph.com")
dani = User.create(first_name: "Dani", last_name: "Dirks", phone:"530-370-3217", gmail: "danidirks@gmail.com")
5.times do
	raph.supporters << Supporter.create(first_name: Faker::Name.first_name,
										last_name: Faker::Name.last_name,
										phone: Faker::PhoneNumber.cell_phone,
										gmail: Faker::Internet.email)
end


5.times do
  dani.supporters << Supporter.create(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    phone: Faker::PhoneNumber.cell_phone,
                    gmail: Faker::Internet.email)
end

dani.supporters << Supporter.create(first_name:Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    phone: "530-370-3217",
                    gmail: Faker::Internet.email)



Trigger_type.new(method_name: 'check_email', frequency_to_run: 5)

Trigger.new(trigger_type_id: 1, user_id: 1, message_text: 'Hey. Call Me.', duration: 10, last_run_timestamp: nil)

Trigger.new(trigger_type_id: 1, user_id: 2, message_text: 'I\'m not feeling so well', duration: 5, last_run_timestamp: nil)
