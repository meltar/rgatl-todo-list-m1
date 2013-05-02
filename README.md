rgatl-todo-list Milestone 1
============================

This application is a basic to-do list!

To get this app up and running, run these commands in console:

```bash
bundle install
```
```bash
rake db:create:all
```
```bash
rake db:migrate
```
```bash
rake db:test:prepare
```

These commands do the following:
  1. Install all of the necessary gems listed in the Gemfile
  2. Create the test and development databases based on the configuration specified in config/database.yml
  3. Add all of the tables and table attributes to the database defined in the migration files in db/migrate
  4. Add all of the tables and table attributes to the test database

Then, to run the tests, run this command in console:
```bash
rspec spec
```
