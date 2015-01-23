# hair_salon
Epicodus assessment week 3


Installation: 
Part 1: Database:
1: In psql enter the command: CREATE DATABASE hair_salon;
2: Connect with the database by entering in: \c hair_salon;
3: Once inside the database enter the command: CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
4: Create a second table by entering the command: CREATE TABLE clients (name varchar, client_id int);
5: Now the database is complete.
6: If you would like to run tests on the application. Connect back with guest by typing \c Guest
  a. Then enter the command CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
  b. This second database will accomodate all testing functionality.



Part 2: Application installation:
1: Clone files from github.com to the machine you would like to run the program on. 
a.You can do this by opening terminal, changing the directory to the location you want the program to be stored.
b. type into " git clone https://github.com/Dalepalmer/hair_salon.git "
2. After the program is done cloning, in your terminal type in " ruby app.rb " to start the sinatra server.
3. Open a webbrowser and in the address bar type in localhost:4567/ to access the web application for Dale's Dastardly Do's.

MIT license. Copyright 2015 Dale Palmer
