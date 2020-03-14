task spec: ["dwh:db:test:prepare"]

namespace :dwh do

  require 'pg'

  task update: [:clear, :populate]

  # task test: :environment do
  #     50.times do    
  #   #   #   Generate fake Adresses
  #     ad = Adress.create!([{
  #         type_adress: [:Billing, :Shipping, :Home, :Business].sample,
  #         status: [:Active, :Inactive].sample,
  #         entity: [:Building, :Customer].sample,
  #         num_street: Faker::Address.unique.secondary_address,
  #         suite: Faker::Number.unique.number(digits: 2),
  #         city: Faker::Address.city_prefix,
  #         postal_code: Faker::Address.unique.postcode,
  #         country: [:US, :CA].sample,
  #         notes: "Note"
  #     }])
  #   end
  # end
  

  task fake: :environment do

    # This file should contain all the record creation needed to seed the database with its default values.
    # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
    #   Create Roles: 1-admin ; 2-customer ; 3-employee 
    Role.create!(id: 1, name: 'admin')if Rails.env.development?
    Role.create!(id: 2, name: 'customer')if Rails.env.development?
    Role.create!(id: 3, name: 'employee')if Rails.env.development?
    # Generate employee user and account
    u = User.create!(email: 'nicolas.genest@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Genest', firstName: 'Nicolas', title: 'Comm Rep', email: 'nicolas.genest@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'nadya.fortier@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
    e = Employee.create!(name: 'Fortier', firstName: 'Nadya', title: 'Director', email: 'nadya.fortier@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'martin.chantal@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
    e = Employee.create!(name: 'Chantal', firstName: 'Martin', title: 'Director Assistant', email: 'martin.chantal@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'mathieu.houde@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
    e = Employee.create!(name: 'Houde', firstName: 'Mathieu', title: 'Captain', email: 'mathieu.houde@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'remi.gagnon@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Gagnon', firstName: 'Remi', title: 'Engineer', email: 'remi.gagnon@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'mathieu.lefrancois@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Lefrancois', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lefrancois@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'serge.savoie@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Savoie', firstName: 'Serge', title: 'Engineer', email: 'serge.savoie@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'david.boutin@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Boutin', firstName: 'David', title: 'Engineer', email: 'david.boutin@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'mathieu.lortie@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Lortie', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', user: u) if Rails.env.development?
    u = User.create!(email: 'thomas.carrier@codeboxx.biz', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    e = Employee.create!(name: 'Carrier', firstName: 'Thomas', title: 'Engineer', email: 'thomas.carrier@codeboxx.biz', user: u) if Rails.env.development?
    
    # Generate fake leads
    30.times do
        Lead.create([{
            name: Faker::Name.name,
            businessname: Faker::Company.name,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.phone_number,
            projectname: Faker::FunnyName.name,
            description: Faker::IndustrySegments.industry,
            department: "Elevators",
            message: Faker::Books::Lovecraft.paragraph,
            # attachment: Faker::File.extension,
            date: Faker::Date.between(from: 5000.days.ago, to: Date.today)
        }])
    end
    
    # Creating 30 adresses / 30 customers / 30 buildings / 30 batteries / 30 columns / 3*30 elevators
    30.times do    

        # Generate fake Adresses
        ad = Adress.create!([{
            type_adress: [:Billing, :Shipping, :Home, :Business].sample,
            status: [:Active, :Inactive].sample,
            entity: [:Building, :Customer].sample,
            num_street: Faker::Address.unique.secondary_address,
            suite: Faker::Number.unique.number(digits: 2),
            city: Faker::Address.city_prefix,
            postal_code: Faker::Address.unique.postcode,
            country: [:US, :CA].sample,
            notes: "Note"
        }])

        #   Generate fake customer
        cu = Customer.create!([{
            creation_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
            company_name: Faker::FunnyName.name,
            contact_fullname: Faker::Name.name,
            contact_phone: Faker::PhoneNumber.phone_number,
            company_email: Faker::Internet.email,
            company_description: Faker::IndustrySegments.industry,
            service_technical_authority_fullname: Faker::Name.name,
            service_technical_authority_phone: Faker::PhoneNumber.phone_number,
            technical_manager_email: Faker::Internet.email,
            user_id: User.order('rand()').limit(1).first.id, # ici user_id prend un id de la table user au hazard
            # adress_id: ad.id  # ici  ad.id  cest id de ladresse qui viens detre creer plus haut 
            adress_id: Adress.order('rand()').limit(1).first.id
        }])
        #   Generate fake building
        bu = Building.create!([{
            building_name: Faker::FunnyName.name,
            building_admin_name: Faker::Name.name,
            building_admin_email: Faker::Internet.email,
            building_admin_phone: Faker::PhoneNumber.phone_number,
            technical_contact_fullname: Faker::Name.name,
            technical_contact_email: Faker::Internet.email,
            technical_contact_phone: Faker::PhoneNumber.phone_number,
            # customer_id: cu.find(params[:id]), # ici  cu.id  cest id de customer qui viens detre creer plus haut
            customer_id: Customer.first.id,
            # User.find(params[:user_id])
            # adress_id: ad.id,   # ici  ad.id  cest id de ladresse qui viens detre creer plus haut 
            adress_id: Adress.order('rand()').limit(1).first.id,
            user_id: Customer.first.id # A verifier, pas sure!!!!!  prend le user_id du custer creer plus haut 
            # user_id: cu.user_id # A verifier, pas sure!!!!!  prend le user_id du custer creer plus haut 
        }])
        #   Generate fake battery
        ba = Battery.create!([{
            type_battery: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
            status: ["Active", "Maintenance", "Inactive"].sample,
            commissioning_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
            last_inspection_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
            information: Faker::IndustrySegments.industry,
            building_id: Building.first.id,    
            employee_id: Employee.order('rand()').limit(1).first.id  # ici employee_id prend un id de la table employee au hazard
        }])
        #   Generate fake column
        co = Column.create!([{
            type_column: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
            status: ["Active", "Maintenance", "Inactive"].sample,
            number_floors: Faker::Number.between(from: 1, to: 70),
            information: Faker::IndustrySegments.industry,
            # battery_id: ba.id  # ici ba.id cest  id de la battery qui viens detre creer plus haut
            battery_id: Battery.first.id  # ici ba.id cest  id de la battery qui viens detre creer plus haut
        }])
        #   Generate  3 fake elevators per column
        3.times do
            Elevator.create!([{
                    serial_number: Faker::Number.number(digits: 7),
                    model: Faker::FunnyName.name,
                    type_elevator: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
                    status: ["Active", "Maintenance", "Inactive"].sample,
                    commissioning_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),
                    inspection_date: Faker::Date.between(from: 5000.days.ago, to: Date.today),  
                    certificate_inspection: Faker::Date.between(from: 5000.days.ago, to: Date.today),  
                    information: Faker::IndustrySegments.industry,
                    column_id: Column.first.id  # ici co.id cest  id de la column qui viens detre creer plus haut
                    # column_id: co.id  # ici co.id cest  id de la column qui viens detre creer plus haut
                }])
        end   
    end     # the end of loop
    #   Generate 30 fake quote
    30.times do
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
            user_id: User.order('rand()').limit(1).first.id, # ici user_id prend un id de la table user au hazard
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
    # Quote.all.each do |q|
    #   puts "INSERT INTO factquotes (quoteid, creation, company, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', #{q.user.company}, #{q.user.email}, #{q.NumELevatorEstimated})"
    #   conn.exec("INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{q.user.company}', '#{q.user.email}', #{q.NumELevatorEstimated})")
    # end 

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