task spec: ["dwh:db:test:prepare"]

namespace :dwh do

  require 'pg'

  task update: [:clear, :populate]

  task fake: :environment do
    #   Generate fake leads
    300.times do
      Lead.create([{
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.phone_number,
          email: Faker::Internet.email,
          businessname: Faker::Company.name,
          projectname: Faker::FunnyName.name,
          department: "Elevators",
          description: Faker::IndustrySegments.industry,
          message: Faker::Books::Lovecraft.paragraph,
          # attachment: "Attachment",
          date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
      }])
    end

    # #   Generate fake building
    20.times do
      Building.create([{
          building_name: Faker::FunnyName.name,
          building_admin_name: Faker::Name.name,
          building_admin_email: Faker::Internet.email,
          building_admin_phone: Faker::PhoneNumber.phone_number,
          technical_contact_fullname: Faker::Name.name,
          technical_contact_email: Faker::Internet.email,
          technical_contact_phone: Faker::PhoneNumber.phone_number,
      }])
    end

    # #   Generate fake Adresses
    50.times do    
      Adress.create!([{
          type_adress: [:Billing, :Shipping, :Home, :Business].sample,
          status: [:Active, :Inactive].sample,
          entity: [:Building, :Customer].sample,
          num_street: Faker::Address.unique.secondary_address,
          suite: Faker::Number.unique.number(digits: 2),
          city: Faker::Address.city_prefix,
          postal_code: Faker::Address.unique.postcode,
          country: [:US, :CA].sample,
          notes: "Note",
      }])
    end

    # #   Generate fake battery
    10.times do
      Battery.create([{
          type_battery: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
          status: ["Active", "Maintenance", "Inactive"].sample,
          commissioning_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
          last_inspection_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
          information: Faker::IndustrySegments.industry,
      }])
    end

    # #   Generate fake column
    10.times do
      Column.create([{
          type_column: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
          status: ["Active", "Maintenance", "Inactive"].sample,
          number_floors: Faker::Number.between(from: 1, to: 70),
          information: Faker::IndustrySegments.industry,
      }])
    end

    # #   Generate fake elevator
    10.times do
      Elevator.create([{
          serial_number: Faker::Number.number(digits: 7),
          model: Faker::FunnyName.name,
          type_elevator: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
          status: ["Active", "Maintenance", "Inactive"].sample,
          commissioning_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
          inspection_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),  
          certificate_inspection: Faker::Date.between(from: 1000.days.ago, to: Date.today),  
          information: Faker::IndustrySegments.industry,
      }])
    end

    # #   Generate fake quote
    300.times do
      Quote.create([{
          NumAppartment: Faker::Number.between(from: 30, to: 300),
          NumFLoors: Faker::Number.between(from: 5, to: 50),
          NumBasement: Faker::Number.between(from: 1, to: 5),
          NumParking: Faker::Number.between(from: 10, to: 70),
          NumBusiness: Faker::Number.between(from: 1, to: 20),
          NumElevatorsDesired: Faker::Number.between(from: 1, to: 10),
          NumOccupantsPerFloor: Faker::Number.between(from: 20, to: 100),
          NumELevatorEstimated: Faker::Number.between(from: 1, to: 10),
          InstallFee: Faker::Number.between(from: 10000, to: 50000),
          SubTotal: Faker::Number.between(from: 10000, to: 50000),
          TotalPrice: Faker::Number.between(from: 10000, to: 50000),
          JobQuality:  ["Standard", "Premium", "Excellium"].sample,
      }])
    end

    # #   Generate fake customer
    300.times do
      Customer.create([{
          creation_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
          company_name: Faker::FunnyName.name,
          contact_fullname: Faker::Name.name,
          contact_phone: Faker::PhoneNumber.phone_number,
          company_email: Faker::Internet.email,
          company_description: Faker::IndustrySegments.industry,
          service_technical_authority_fullname: Faker::Name.name,
          service_technical_authority_phone: Faker::PhoneNumber.phone_number,
          technical_manager_email: Faker::Internet.email,
    }])
    end
  end

  task print: :environment do

    
    puts "Finished inserting records"
  end

  task clearfake: :environment do
    mysqldb = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
    puts mysqldb.connection.current_database
    # mysqldb.connection.execute("TRUNCATE users")
    mysqldb.connection.execute("SET FOREIGN_KEY_CHECKS = 0;")
    mysqldb.connection.execute("TRUNCATE adresses")
    mysqldb.connection.execute("TRUNCATE batteries")
    mysqldb.connection.execute("TRUNCATE building_details")
    mysqldb.connection.execute("TRUNCATE buildings")
    mysqldb.connection.execute("TRUNCATE columns")
    mysqldb.connection.execute("TRUNCATE customers")
    mysqldb.connection.execute("TRUNCATE elevators")
    mysqldb.connection.execute("TRUNCATE leads")
    mysqldb.connection.execute("TRUNCATE quotes")
    mysqldb.connection.execute("TRUNCATE users")
    mysqldb.connection.execute("TRUNCATE roles")
    mysqldb.connection.execute("TRUNCATE users_roles")
    mysqldb.connection.execute("TRUNCATE employees")
    mysqldb.connection.execute("SET FOREIGN_KEY_CHECKS = 1;")
    puts "Cleared table"
  end

  task clear: :environment do 
    conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
    puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"
    conn.exec("TRUNCATE TABLE dimcustomers RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factcontact RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factelevator RESTART IDENTITY;")
    puts "Cleared table"
  end

  task populate: :environment do
    conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
    puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

    # FACT QUOTES
    Quote.all.each do |q|
      puts "INSERT INTO factquotes (quoteid, creation, company, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', #{q.user.company}, #{q.user.email}, #{q.NumELevatorEstimated})"
      conn.exec("INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{q.user.company}', '#{q.user.email}', #{q.NumELevatorEstimated})")
    end 

    # FACT CONTACT
    Lead.all.each do |l|
      puts "INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.businessname}', '#{l.email}', #{l.projectname})"
      conn.exec("INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.businessname}', '#{l.email}', '#{l.projectname}')")
    end

    # FACT ELEVATOR
      Elevator.all.each do |e|
        puts "INSERT INTO factelevator (serialnumber, commissioningdate, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.commissioning_date}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.adress_id}')"
        conn.exec("INSERT INTO factelevator (serialnumber, commissioningdate, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.commissioning_date}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.adress_id}')")
      end

    # DIMENSION CUSTOMERS
      array = Array.new
      Customer.all.each do |a|
          Building.all.each do |b|
            Battery.all.each do |c|
              Column.all.each do |d|
                Elevator.all.each do |e|
                  total = d.elevators.count
                  array.push(total)
                end
              end
            end
          end
        nbelevators = array.count
        # pp nbelevators
        puts "INSERT INTO dimcustomers (creationdate, companyname, companycontactfullname, companycontactemail, nbelevators, customercity) VALUES ('#{a.creation_date}', '#{a.company_name}', '#{a.contact_fullname}', '#{a.company_email}', #{nbelevators}, '#{a.adress.city}')"
        conn.exec("INSERT INTO dimcustomers (creationdate, companyname, companycontactfullname, companycontactemail, nbelevators, customercity) VALUES ('#{a.creation_date}', '#{a.company_name}', '#{a.contact_fullname}', '#{a.company_email}', #{nbelevators}, '#{a.adress.city}')")
        array.clear
      end
    
    puts "Finished inserting records"
  end

########################################################################################################################
########################################################################################################################

  namespace :db do |ns|

    task :drop do
      Rake::Task["db:drop"].invoke
    end

    task :create do
      Rake::Task["db:create"].invoke
    end

    task :setup do
      Rake::Task["db:setup"].invoke
    end

    task :migrate do
      Rake::Task["db:migrate"].invoke
    end

    task :status do
      Rake::Task["db:migrate:status"].invoke
    end

    task :rollback do
      Rake::Task["db:rollback"].invoke
    end

    task :seed do
      Rake::Task["db:seed"].invoke
    end

    task :version do
      Rake::Task["db:version"].invoke
    end

    namespace :schema do
      task :load do
        Rake::Task["db:schema:load"].invoke
      end

      task :dump do
        Rake::Task["db:schema:dump"].invoke
      end
    end

    namespace :test do
      task :prepare do
        Rake::Task["db:test:prepare"].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ["dwh:set_custom_config"] do
        Rake::Task["dwh:revert_to_original_config"].invoke
      end
    end
  end

  task :set_custom_config do
    # save current vars
    @original_config = {
      env_schema: ENV['SCHEMA'],
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    ENV['SCHEMA'] = "db_dwh/schema.rb"
    Rails.application.config.paths['db'] = ["db_dwh"]
    Rails.application.config.paths['db/migrate'] = ["db_dwh/migrate"]
    Rails.application.config.paths['db/migrate/status'] = ["db_dwh/migrate/status"]
    Rails.application.config.paths['db/seeds'] = ["db_dwh/seeds.rb"]
    Rails.application.config.paths['config/database'] = ["config/dwh_database.yml"]
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end
end