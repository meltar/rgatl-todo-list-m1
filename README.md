rgatl-todo-list
===============

This application is a basic to-do list!

To get this app up and running, run these commands in console:

bundle install
^this command installs all of the necessary gems listed in the Gemfile

rake db:create:all
^this command creates the test and development databases based on the configuration found in config/database.yml

rake db:migrate
^this command adds all of the tables and table attributes to the database defined in the migration files in db/migrate

Then, to run the tests, run this command in console:
rspec spec
