# Rocket_Elevators_Information_System

WEEK 4 - Web Programming With Ruby On Rails

Features :
- Beautiful website;
- Beautiful programmers;
- "Conditionnal" navbar that shows admin panel/profile depending on user's auth;
- Authentication (sign up, sign out, sign in);
- Submission form w/ submit POST REQUEST;
- Backoffice (admin panel);


INSTRUCTIONS

Admin email/pass : default@example.com / password

Since this is on localhost, an admin needs to be created at first. If the default admin auth (shown above) does not work, please do the following :

1) CD --> repo
2) Rails console
3) user = User.first
4) user.admin = true
5) user.save
6) exit

You can now login as an admin (unless it worked at first) !
