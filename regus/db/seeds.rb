# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

providers = ["@gmail.com", "@yahoo.com", "@mail.com"]

names = [	"Carole Cannon", "Lucy Zimmerman", "Robin Curry", "Eloise Mendoza", "Jacqueline Carr", "Leah Fleming", 
			"Simon Wade", "Isabel Thomas", "Ronald Hayes", "Jonathan Underwood", "Thelma Hogan", "Maryann Jacobs", 
			"Myra Higgins", "Noah Owens", "Thomas Murray", "Terence Payne", "Janie Griffin", "Eric Goodwin", 
			"Dominick Conner", "Doyle Woods", "George Walsh", "Marilyn Lawson", "Lorenzo Anderson", "Carmen Park", 
			"Danielle Benson", "Kerry Henry", "Marian Newman", "Bobbie Cobb", "Bonnie Morgan", "Alfred Goodman",
			"Madeline Floyd", "Patrick Woods", "Stewart Dennis", "Laverne Hammond", "Angelina Gross", "Gloria Morris", 
			"Carmen Parsons", "Leroy Page", "Louis Neal", "Bryan Saunders", "Brad Lawrence", "Cecilia Reed", 
			"Manuel Fields", "Frances Stephens", "Lena Hall", "Woodrow Lambert", "Bertha George", "Regina Bennett", 
			"Armando Pearson", "Stephen Wheeler", "Inez Brewer", "Crystal Pratt", "Danielle Mcdonald", "Kristen Lucas", 
			"Jessie Harrison", "Steve Fowler", "Angelina Bailey", "Fredrick Weaver", "Shaun Owens", "Orlando Norris" ]

locations = [ "CSUC Dorms", "Country Club Lanes", "Round Table Pizza", "Private Home", "7th Street Manor", "Breakfast Buzz", "Madison Bear Garden", "Mom's Diner", "The Banshee"]

streets = [ "855 Johnson Street", "95 Rockledge Street", "109 Aspen Lane", "8977 Sierra Dr", "315 Bohemia Street", "737 Chestnut Drive", 
			"7425 Bald Hill Rd", "8458 Sussex Ave", "745 La Sierra Ave", "997 South Arcadia Lane", "716 River Court", "8046 Clinton Dr",
			"7768 Yukon Dr", "9041 East 10th Ave", "841 Sunbeam Ave", "8323 South Wild Rose St", "4 South Jefferson Dr", "104 Mayfair Dr",
			"578 W. Military Ave", "521 Wrangler Street", "9537 Williams St", "4 N. Sleepy Hollow Ave", "757 Peachtree St", "8562 Taylor Road",
			"574 Proctor Drive", "69 Green Hill Ave", "333 Gates St", "65 White Street", "927 Snake Hill St", "3 E. Shade Rd"]

cities = [ "Ridgefield", "Ft Mitchell", "Great Falls", "Baton Rouge", "Tullahoma", "Maumee",
			"Virginia Beach", "Lacey", "Concord", "Jenison", "San Lorenzo", "Lake Jackson", 
			"Englishtown", "Sterling Heights", "Clifton", "Potomac", "Lincoln Park", "Johnson City",
			"Bradenton", "Richmond", "Stillwater", "Millington", "Pasadena", "Midland",
			"Phillipsburg", "Skokie", "Randallstown", "Maplewood", "Jamestown", "Englewood"]

companies = [ "Home Depot", "BlakBerry", "Siemens AG", "Tesco Corporation", "3M", "Corona", 
			  "Citigroup", "Kia Motors", "At&t", "SAP", "Lous Vuitton", "Nintendo",
			  "Credit Suisse", "Google", "H&M", "MTV", "Pampers", "Gucci", 
			  "Facebook Inc", "Kellogg Company", "Xerox", "Panosonic Corporation", "General Electric", "Porsche", 
			  "Morgan Stanle", "The Walt Disney Company", "Budweiser Stag Brewing Company", "Deere & Company", "NTT Data", "Nike Inc" ]

contractors = [ "Rockstar Works", "Sierra Works", "Butterfly Works", "Broadway Works", "Oriental Works", "Jupiter Works",
				"Main Street Works", "Velocity Works", "Cougar Works", "Hippo Works", "Guardian Works", "Cobra Works", 
				"Princess Works", "Rolling Works", "Orchid Works", "Ebony Works", "Crimson Works", "Backyard Works",
				"Topic Works", "Prosperity Works", "Blackjack Works", "Phanton Works", "Skyline Works", "Marathon Works",
				"Paragon Works", "Vantage Works", "Gecko Works", "Roman Works", "Promote Works", "Parker Works" ]

users = User.create (
	[
		{ fname: 'Cody',	lname: 'Pritchard',	username: 'cpritchard', phone: '5306513304', email: 'cpritchard@micron.com',	password: 'Halo44life', password_confirmation: 'Halo44life',	admin: true, rgroup: false, rlab: false},
		{ fname: 'Donny', 	lname: 'Sager', 	username: 'dsager', 	phone: '9163807050', email: 'dsager@regus.com', 		password: 'password', 	password_confirmation: 'password', 		admin: false, rgroup: true, rlab: false },
		{ fname: 'John', 	lname: 'Locke', 	username: 'jlocke', 	phone: '5306768731', email: 'jlock@regus.com', 			password: 'password', 	password_confirmation: 'password', 		admin: false, rgroup: false, rlab: true },
	]
)


jobs = Job.create (
	[
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 1, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 1, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 2, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 1, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 3, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 2, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 4, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 2, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 5, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 2, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 6, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 7, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 8, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 9, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},
		{ date: Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)), user_id: 3, company_id: rand(1..30), subcontractor_id: rand(1..30), jobsite_id: 1, company_contact_id: rand(1..60), subcontractor_contact_id: rand(1..60), jobsite_contact_id:  rand(1..60)},		
	]
)


companies.each do | cur |
	Company.create ([{ 	name: cur, 
						phone: rand(9161111111..9169999999).to_s, 
						street: streets.sample, city: cities.sample, 
						state: 'CA', 
						zip: rand(95111..95999).to_s, 
						email: (0..20).map{('a'..'z').to_a[rand(26)]}.join + providers.sample, 	
						website: 'testurl.com'}])
end

names.each do | cur |
	CompanyContact.create ([{ 	name: cur, 
								phone: rand(9161111111..9169999999).to_s, 
								email: (0..20).map{('a'..'z').to_a[rand(26)]}.join + providers.sample, }])
								# company_id: rand(1..30) }])
end


contractors.each do | cur |
	Subcontractor.create ([{ 	name: cur, 
								phone: rand(5301111111..5309999999).to_s, 
								street: streets.sample, city: cities.sample, 
								state: 'CA', 
								zip: rand(95111..95999).to_s, 
								email: (0..20).map{('a'..'z').to_a[rand(26)]}.join + providers.sample, 	
								website: 'testurl.com'}])
end 

names.shuffle
names.each do | cur |
	SubcontractorContact.create ([{ name: cur, 
									phone: rand(5301111111..5309999999).to_s, 
									email: (0..20).map{('a'..'z').to_a[rand(26)]}.join + providers.sample, }])
									# subcontractor_id: rand(1..30) }])
end


jobsites = Jobsite.create (
	[
		{ name: locations[0], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[1], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[2], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[3], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[4], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[5], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[6], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[7], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: locations[8], street: streets.sample, city: cities.sample, state: 'CA', zip: rand(95111..95999).to_s },
		{ name: "My Apartment", street: "1043 W 7th St", city: "Chico", state: 'CA', zip: '95926', full_address: "1043 W 7th St,Chico,CA,95926" },
		{ name: "My House", street: "3177 Shawnee Ct", city: "Cameron Park", state: 'CA', zip: '95682', full_address: "3177 Shawnee Ct,CameronPark,CA,95682"}
	]
)

names.shuffle
names.each do | cur |
	JobsiteContact.create ([{ 	name: cur, 
								phone: rand(5301111111..5309999999).to_s, 
								email: (0..20).map{('a'..'z').to_a[rand(26)]}.join + providers.sample, }])
								# jobsite_id: rand(1..9) }])
end

turn_around_time = TurnAroundTime.create(
	[
		{ turntime: "Same Day"},
		{ turntime: "Rush"},
		{ turntime: "2 Day"},
		{ turntime: "3 Day"},
		{ turntime: "7 Day"},
		{ turntime: "2 Week"},
	]
)

# xrf_cocs = XrfCoc.create(
# 	[
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", xrfunit: "RMD LPA-1", xrfmode: "Standard", actionlevel: "0.5", abatementlevel: "0.5", job_type: "Inspection", cli_type: "Lead", job_id: 1, user_id: 3},
# 	]
# )

# tapebulk_cocs = TapeBulkCoc.create(
# 	[
# 		{date: Time.now, turnaround: "Same Day", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 	]
# )

# mycometer_cocs = MycometerCoc.create(
# 	[
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 64, reaction_time: "41:59", liters_minute: "15", duration: "20", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 65, reaction_time: "41:02", liters_minute: "15", duration: "20", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 66, reaction_time: "39:31", liters_minute: "15", duration: "20", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 67, reaction_time: "38:03", liters_minute: "15", duration: "20", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 68, reaction_time: "36:39", liters_minute: "15", duration: "20", job_type: "Inspection", cli_type: "Mold", job_id: 1, user_id: 1},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Clearance", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 69, reaction_time: "35:18", liters_minute: "15", duration: "20", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Clearance", building_type: "Mechanically Ventilated", sampling_method: "Agressive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 70, reaction_time: "34:01", liters_minute: "15", duration: "20", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Clearance", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 71, reaction_time: "32:46", liters_minute: "15", duration: "20", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Clearance", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 72, reaction_time: "31:35", liters_minute: "15", duration: "20", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Clearance", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 73, reaction_time: "30:26", liters_minute: "15", duration: "20", job_type: "Laboratory", cli_type: "Mold", job_id: 1, user_id: 2},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 74, reaction_time: "29:20", liters_minute: "15", duration: "20", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 75, reaction_time: "28:17", liters_minute: "15", duration: "20", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 76, reaction_time: "27:16", liters_minute: "15", duration: "20", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 77, reaction_time: "26:18", liters_minute: "15", duration: "20", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 		{date: Time.now, turnaround: "Same Day", mold_air: "Baseline", building_type: "Non Ventilated", sampling_method: "Passive", test_unit: "Dwyer VFB Visi-Float Flowmeter", ambient_temp: 78, reaction_time: "25:22", liters_minute: "15", duration: "20", job_type: "Clearance", cli_type: "Mold", job_id: 1, user_id: 3},
# 	]
# )

lead_report_positive = LeadReportPositive.create(
	[
		{ purpose: "The purpose of this service was to conduct a Lead Inspection in order to assist the client/owner-operator with determining whether or not Lead Containing Materials (LCM) or Lead Based Paint (LBP) are present in the planned renovation and/or demolition of the specified areas. A representative number of samples were collected throughout the areas determined to be disturbed and are listed herein.

The samples were collected according to the Housing Urban Development (HUD) Guidelines, the Environmental Protection Agency (EPA) and California Public Health Department, who regulate and require the abatement or in-place management of LCM/LBP hazards equal to or greater than 1.0 milligram per square centimeter (1.0 mg/cm&#178) of lead or more than 0.5% lead by weight.  The following regulation shall be adhered to per OSHA 29 CFR 1926.62, California Occupational Safety and Health Standard, Title 8 (Cal/OSHA 8 CCR 1532.1).",
		  analytics: "<b>Based on the samples collected from the site <ADD SAMPLE LOCATIONS HERE> were found to contain LCM or LBP levels above the OSHA limit of detection.</b> The location of the LCM/LBP type, percent, and condition can be found on the attached analytical report. No destructive sampling was conducted during the site visit. If in the course of work, additional suspect building materials are discovered (i.e.: inaccessible areas), the renovation/demolition activities must cease until further sampling is conducted.",
		  results: "Federal and state regulations require that the employer must ensure that the worker is properly trained in accordance with Title 8 (Cal/OSHA 8 CCR 1532 (1) (2) and shall produce evidence that the worker is not being exposed above the Action Level (AL) and/or the Permissible Exposure Limit (PEL).  In the event that no current data is readily available for the worker(s), then the employer shall conclude that the worker is being exposed above the PEL.  This SHALL trigger the employer to provide advanced training and certifications for the employees working with LCM.",
  		  recommendations: "RegasGroup recommends the In-place Management or the Abatement Method of the LCM/LBP. If the In-Place Management method is to be used, prior to the repainting of the affected surface areas, the loose flaky paint must be removed until the remaining paint adheres smoothly to the substrate. Once this task is completed, the surface area can be repainted without the possibility of paint being dislodged and falling to the floor or ground areas. 

If the Abatement Method of all surfaces is to be completed, then the debris and any loose flaky paint must be bagged or burrito wrapped prior to the removal of the debris from the work area(s) and subsequently the site.  Because the samples listed were found to contain LCM/LBP, all areas where the LCM/LBP will be disturbed will require abatement, encapsulation, and/or prep work by a certified lead worker. Once the abatement, in-place management, and/or prep work is completed and the areas are stabilized, the existing surfaces will be in good condition and not create a health or safety concern to the workers conducting the general construction work at the site.  A Scope of Work and/or specifications can be provided to be utilized to conduct the lead work at the site.

Prior to the demolition work being completed and/or the transporting of the debris from the site, Health and Safety Code 25157.8 (AB 2784 National Resources) requires that all lead debris be sampled for Waste Characterization. This will assist the Contractor in making a determination of whether or not the material is to be considered Hazardous or Non-Hazardous Lead Waste or General Construction 
Debris. The sequence of testing to be completed by the Contractor is as follows:<ul>
    <li>Total Threshold Limit concentration (TTLC) with a result of 50 mg/kg or more but less than 1,000 mg/kg of lead must be retested using the Soluble Threshold Limit concentration (STLC) method</li>
    <li>A STLC result of 5.0 mg/L or greater is considered California Hazardous Waste</li>
    <li>Total Characteristic Leaching Procedure (TCLP) testing shall only be accomplished when approved by the Owners Representative; This procedure shall be generally reserved for out-of-state shipments; and A TCLP result of 5.0 mg/L or more deems the waste Federal RCRA materials; and</li>
    <li>The California hazardous waste threshold for total lead using STLC is 5 mg/L and</li>
    <li>Lead paint that is intact on a surface does not permit the material to be classed as non-hazardous.  Waste profiling shall be accomplished if the paint contains more than 350 ppm by Flame AAS.  Exception:  Metals that are coated with paint are to be recycled.</li>
  </ul>",
  		  assumptions: "The results, findings, conclusions, and recommendations expressed in this report are based only on conditions that were noted during RegasGroup’s inspection of the specific areas noted herein.  

The selection of sample locations and frequency of sampling was based on observations and the assumption that like materials in the same area are homogeneous in content. This report is not to be utilized as a bidding document or as a project specification document since it does not have all the components required to serve as a Lead Abatement Project Design document or a Lead Abatement Work plan.  

Our professional services have been performed, our findings obtained, and our conclusions and recommendations prepared in accordance with customary principles and practices in the fields of environmental testing and consulting. This report does not warrant against undiscovered hazards and locations not investigated. 

If you have any questions regarding this report or if I can be of further assistance, please feel free to contact me."}
	]
)


lead_report_negative = LeadReportNegative.create(
	[
		{ purpose: "The purpose of this service was to conduct a Lead Inspection in order to assist the client/owner-operator with determining whether or not Lead Containing Materials (LCM) or Lead Based Paint (LBP) are present in the planned renovation and/or demolition of the specified areas. A representative number of samples were collected throughout the areas determined to be disturbed and are listed herein.

The samples were collected according to the Housing Urban Development (HUD) Guidelines, the Environmental Protection Agency (EPA) and California Public Health Department, who regulate and require the abatement or in-place management of LCM/LBP hazards equal to or greater than 1.0 milligram per square centimeter (1.0 mg/cm&#178) of lead or more than 0.5% lead by weight.  The following regulation shall be adhered to per OSHA 29 CFR 1926.62, California Occupational Safety and Health Standard, Title 8 (Cal/OSHA 8 CCR 1532.1).",
		  analytics: "<b>Based on the samples collected from the site, no lead containing material or lead based paint was found to be present.</b> All work may be conducted by a general contractor without any health and safety concerns to lead exposure. If in the course of work, additional suspect building materials are discovered (i.e.: inaccessible areas), the renovation/demolition activities must cease until further sampling is conducted.",
		  results: "The location and results from this sampling are as follows:",
		  assumptions: "The results, findings, conclusions, and recommendations expressed in this report are based only on conditions that were noted during RegasGroup’s inspection of the specific areas noted herein.  

The selection of sample locations and frequency of sampling was based on observations and the assumption that like materials in the same area are homogeneous in content. This report is not to be utilized as a bidding document or as a project specification document since it does not have all the components required to serve as a Lead Abatement Project Design document or a Lead Abatement Work plan.  

Our professional services have been performed, our findings obtained, and our conclusions and recommendations prepared in accordance with customary principles and practices in the fields of environmental testing and consulting. This report does not warrant against undiscovered hazards and locations not investigated. 

If you have any questions regarding this report or if I can be of further assistance, please feel free to contact me." }
	]
)




