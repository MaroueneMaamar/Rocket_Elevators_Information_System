namespace :demo do
    desc "Data warehouse export"
    require 'pg'

    task all: [:clear, :populate]

    task clear: :environment do 
        conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
        puts "Database : #{conn.db}"
        puts "Username : #{conn.user}"
        puts "Password : #{conn.pass}"

        conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
        puts "Cleared table"
    end

    task populate: :environment do
        conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
        puts "Database : " + conn.db
        puts "Username : " + conn.user
        puts "Password : " + conn.pass

        Quote.all.each do |q|
            puts "INSERT INTO factquotes (quoteid, nbelevator) VALUES (#{q.id}, #{q.NumELevatorEstimated})"
            conn.exec("INSERT INTO factquotes (quoteid, nbelevator) VALUES (#{q.id}, #{q.NumELevatorEstimated})")
        end 
        puts "Finished inserting records"
    end

    task test: :environment do

        # conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
        #     puts "User : " + conn.user  # Printing the username of the connected database
        #     puts "Database name : " + conn.db  # Printing the username of the connected database
        #     puts "Password : " + conn.pass  # Printing the username of the connected database

        # res = conn.exec('INSERT INTO factquotes SELECT NumELevatorEstimated FROM quotes').each do |q|
        #     puts q
        # end

            #that_db = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])

            # con.exec "CREATE TABLE Cars(Id INTEGER PRIMARY KEY, 
            # Name VARCHAR(20), Price INT)"
            # con.exec "INSERT INTO Cars VALUES(1,'Audi',52642)"
            

            # dbname = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development_dwh'])
            # dbname.connection.execute("TRUNCATE TABLE factquotes RESTART IDENTITY;")
            # puts "Table cleared."

            # conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
            # puts "Database : " + conn.db
            # puts "Username : " + conn.user
            # puts "Password : " + conn.pass

            # conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
            # puts "Cleared table"

            # Quote.all.each do |q|
            #     puts "INSERT INTO factquotes (quoteid, nbelevator) VALUES (#{q.id}, #{q.NumELevatorEstimated})"
            #     conn.exec("INSERT INTO factquotes (quoteid, nbelevator) VALUES (#{q.id}, #{q.NumELevatorEstimated})")
            #     puts "Finished inserting records"
            # end 
            # old_db = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development_dwh'])
            # puts "Database : " + old_db.connection.current_database  # Printing the username of the connected database

            # result = ActiveRecord::Base.connection.select_all('SELECT NumELevatorEstimated FROM quotes').each do |row|
            # result = ActiveRecord::Base.connection.select_all('INSERT INTO datawarehouse.factquotes SELECT NumELevatorEstimated FROM that_db.quotes').each do |row|
            #     puts row

                # conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')

                # result.each do 
                #     conn.exec('INSERT INTO factquotes SELECT NumELevatorEstimated FROM quotes') 
                # end

                # conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
                # res = conn.exec('INSERT INTO factquotes (NumELevatorEstimated) SELECT NumELevatorEstimated FROM Application_development.quotes').each do |q|
                #     puts q
                # end

                # INSERT INTO newDatabase.table1 (Column1, Column2) 
                # SELECT column1, column2 FROM oldDatabase.table1;
            # end

            # conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
            # res = conn.exec('INSERT INTO factquotes SELECT NumELevatorEstimated FROM quotes').each do |q|
            #     puts q
            # end


            

        #         end

        #     end

        #     require 'pg'

        #     conn = PGconn.connect("ip adddress", 5432, '', '', "db name", "user", "password")
        #     res  = conn.exec('select tablename, tableowner from pg_tables')
            
        #     res.each do |row|
        #       puts row['tablename'] + ' | ' + row['tableowner']
        #     end    


        # conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
        #     user = conn.user
        #     db_name = conn.db
        #     pswd = conn.pass
        #     puts "User: #{user}"                # Printing the username of the connected database
        #     puts "Database name: #{db_name}"    # Printing the database name of the connected database
        #     puts "Password: #{pswd}"            # Printing the password of the connected database

            # INSERT INTO dbo.EmployeeSales  
            # SELECT BusinessEntityID, SalesYTD   
            # FROM Sales.SalesPerson;  
        # result = conn.exec('SELECT * FROM quotes') do |result|


            # res = conn.exec_params('SELECT $1 AS a, $2 AS b, $3 AS c', [1, 2, nil])
        # result.each do |row|
        #     puts "brah"
            
        # end

        # Output a table of current connections to the DB
        # conn = PG.connect( dbname: 'sales' )
        # conn.exec( "SELECT * FROM pg_stat_activity" ) do |result|
        # puts "     PID | User             | Query"
        # result.each do |row|
        #     puts " %7d | %-16s | %s " %
        #     row.values_at('procpid', 'usename', 'current_query')
        # end
        # end


        # connection = ActiveRecord::Base.establish_connection("development_sec")
        # ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development_sec'])
        # old_db = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
        # quotes = old_db.connection.execute('SELECT * FROM quotes').each do |q|
        #     if (quotes != nil) 
        #         new_db = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development_sec'])
        #         quotes.each do |p|
        #             new_db.quotes.create()
        #         end
        #     end
        # end


        #arr1 = ActiveRecord::Base.establish_connection(conn1).connection.execute("select * from tbl").to_a


        # puts quotes
        # quotes = Quote.new
        # quotes.each do |p|
        #     Quote.create()
        #     quotes = Quote.new(p)
        # end

        # sql = "SELECT * FROM quotes"
        # ActiveRecord::Base.connection.execute(sql).each do |row|
        # connection = ActiveRecord::Base.connection
        # result = ActiveRecord::Base.connection.select_all('SELECT * FROM quotes').each do |row|
        #     puts row
        # end

        # ActiveRecord::Base.connection.execute('SELECT * FROM quotes')
        # p result

        # class Quote < ActiveRecord::Base
        # end

        # puts Quote.columns
        # my_quote = Quote.new

        # my_result = 

#         values = ActiveRecord::Base.connection.exec_query("select * from clients")
# p values
        # puts p
        # @quote = Quote.new(p)
        # @quote.save!
        # @connection = ActiveRecord::Base.connection
        # result = @connection.exec_query('SELECT * FROM users')
    end
end