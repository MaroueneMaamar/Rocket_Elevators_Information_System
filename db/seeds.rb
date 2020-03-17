# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#   Create Roles: 1-admin ; 2-customer ; 3-employee 
# Role.create!(id: 1, name: 'admin')if Rails.env.development?
# Role.create!(id: 2, name: 'customer')if Rails.env.development?
# Role.create!(id: 3, name: 'employee')if Rails.env.development?

# # Generate employee user and account
# u = User.create!(email: 'nicolas.genest@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Genest', firstName: 'Nicolas', title: 'Comm Rep', email: 'nicolas.genest@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'nadya.fortier@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
# e = Employee.create!(name: 'Fortier', firstName: 'Nadya', title: 'Director', email: 'nadya.fortier@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'martin.chantal@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
# e = Employee.create!(name: 'Chantal', firstName: 'Martin', title: 'Director Assistant', email: 'martin.chantal@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'mathieu.houde@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
# e = Employee.create!(name: 'Houde', firstName: 'Mathieu', title: 'Captain', email: 'mathieu.houde@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'remi.gagnon@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Gagnon', firstName: 'Remi', title: 'Engineer', email: 'remi.gagnon@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'mathieu.lefrancois@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Lefrancois', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lefrancois@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'serge.savoie@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Savoie', firstName: 'Serge', title: 'Engineer', email: 'serge.savoie@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'david.boutin@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Boutin', firstName: 'David', title: 'Engineer', email: 'david.boutin@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'mathieu.lortie@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Lortie', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', user: u) if Rails.env.development?

# u = User.create!(email: 'thomas.carrier@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
# e = Employee.create!(name: 'Carrier', firstName: 'Thomas', title: 'Engineer', email: 'thomas.carrier@codeboxx.biz', user: u) if Rails.env.development?

#   Generate fake Adresses
# 100.times do    
#     Adress.create!([{
#         type_adress: [:Billing, :Shipping, :Home, :Business].sample,
#         status: [:Active, :Inactive].sample,
#         entity: [:Building, :Customer].sample,
#         num_street: Faker::Address.unique.secondary_address,
#         suite: Faker::Number.unique.number(digits: 2),
#         city: Faker::Address.city_prefix,
#         postal_code: Faker::Address.unique.postcode,
#         country: [:US, :CA].sample,
#         notes: "Note",
#     }])
# end

# #   Generate fake leads
# 300.times do
#     Lead.create([{
#         name: Faker::Name.name,
#         businessname: Faker::Company.name,
#         email: Faker::Internet.email,
#         phone: Faker::PhoneNumber.phone_number,
#         projectname: Faker::FunnyName.name,
#         description: Faker::IndustrySegments.industry,
#         department: "Elevators",
#         message: Faker::Books::Lovecraft.paragraph,
#         attachment: Faker::File.extension,
#         date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
#     }])
# end

# #   Generate fake building
# 10.times do
#     Building.create([{
#         building_name: Faker::FunnyName.name,
#         building_admin_name: Faker::Name.name,
#         building_admin_email: Faker::Internet.email,
#         building_admin_phone: Faker::PhoneNumber.phone_number,
#         technical_contact_fullname: Faker::Name.name,
#         technical_contact_email: Faker::Internet.email,
#         technical_contact_phone: Faker::PhoneNumber.phone_number,
#     }])
# end

# #   Generate fake battery
# 10.times do
#     Battery.create([{
#         type_battery: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#         status: ["Active", "Maintenance", "Inactive"].sample,
#         commissioning_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
#         last_inspection_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
#         information: Faker::IndustrySegments.industry,
#     }])
# end

# #   Generate fake column
# 10.times do
#     Column.create([{
#         type_column: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#         status: ["Active", "Maintenance", "Inactive"].sample,
#         number_floors: Faker::Number.between(from: 1, to: 70),
#         information: Faker::IndustrySegments.industry,
#     }])
# end

# #   Generate fake elevator
# 10.times do
#     Elevator.create([{
#         serial_number: Faker::Number.number(digits: 7),
#         model: Faker::FunnyName.name,
#         type_elevator: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#         status: ["Active", "Maintenance", "Inactive"].sample,
#         commissioning_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
#         inspection_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),  
#         certificate_inspection: Faker::Date.between(from: 5000.days.ago, to: Date.today),  
#         information: Faker::IndustrySegments.industry,
#     }])
# end

# #   Generate fake quote
# 300.times do
#     Quote.create([{
#         NumAppartment: Faker::Number.between(from: 30, to: 300),
#         NumFLoors: Faker::Number.between(from: 5, to: 50),
#         NumBasement: Faker::Number.between(from: 1, to: 5),
#         NumParking: Faker::Number.between(from: 10, to: 70),
#         NumBusiness: Faker::Number.between(from: 1, to: 20),
#         NumElevatorsDesired: Faker::Number.between(from: 1, to: 10),
#         NumOccupantsPerFloor: Faker::Number.between(from: 20, to: 100),
#         NumELevatorEstimated: Faker::Number.between(from: 1, to: 10),
#         InstallFee: Faker::Number.between(from: 10000, to: 50000),
#         SubTotal: Faker::Number.between(from: 10000, to: 50000),
#         TotalPrice: Faker::Number.between(from: 10000, to: 50000),
#         JobQuality:  ["Standard", "Premium", "Excellium"].sample,
#     }])
# end

# #   Generate fake customer
# 300.times do
#     Customer.create([{
#         creation_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
#         company_name: Faker::FunnyName.name,
#         contact_fullname: Faker::Name.name,
#         contact_phone: Faker::PhoneNumber.phone_number,
#         company_email: Faker::Internet.email,
#         company_description: Faker::IndustrySegments.industry,
#         service_technical_authority_fullname: Faker::Name.name,
#         service_technical_authority_phone: Faker::PhoneNumber.phone_number,
#         technical_manager_email: Faker::Internet.email,
# }])
# end
