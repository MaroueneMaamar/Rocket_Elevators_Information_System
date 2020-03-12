task spec: ["dwh:db:test:prepare"]

namespace :dwh do

  require 'pg'
  
  task update: [:clear, :populate]

  task print: :environment do
    # test = Quote.current_user.email
    # test = User.find(@current_user) # shit asking for id
    # test = User.current.username
    # test = current_user.username
    # current_user.name
    puts test
    # username = subject.current_user
    # puts username

    # @request.email = current_user.email
    # @request.save
  end

  task clear: :environment do 
      conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
      puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

      conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
      puts "Cleared table"
  end

  task populate: :environment do
      conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
      puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

      Quote.all.each do |q|
          puts "INSERT INTO factquotes (quoteid, nbelevator) VALUES (#{q.id}, #{q.NumELevatorEstimated}, '#{q.created_at}', #{q.user.email})"
          # conn.exec("INSERT INTO factquotes (quoteid, nbelevator, creation, email) VALUES (#{q.id}, #{q.NumELevatorEstimated}, '#{q.created_at}', #{q.session[:session_id]})")
      end 
      puts "Finished inserting records"
  end

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