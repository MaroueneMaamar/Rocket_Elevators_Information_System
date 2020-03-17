# Rocket_Elevators_Information_System

WEEK 5 - DataWareHouse

Video showcase : https://www.youtube.com/watch?v=s1fqTdb0Oro

Features :
- Beautiful website;
- Beautiful programmers;
- One relational databse (mysql);
- One datawarehouse (postgresql);
- Multiple tables with relations;
- Contact form w/ submit POST REQUEST;
- Backoffice (admin panel) with charts;
- Rake task to fully operate the databases.

INSTRUCTIONS

Admin email/pass : mathieu.houde@codeboxx.biz / password
For the admin pannel - Look in the navigation bar for the admin pannel button.
For the charts - Open up the admin panel, look at the dashboard page and you should see a clickable link in the chat section.

RAKE TASK

- Rake dwh:clear      : truncates the mysql tables
- Rake dwh:cleardwh   : truncates the postgresql tables
- Rake dwh:fake       : truncates the mysql tables AND fakes all the information
- Rake dwh:populate   : populates all the tables in the datawarehouse
- Rake dwh:update     : truncates the postgresql tables AND populates them
