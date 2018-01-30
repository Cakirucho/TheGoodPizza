# README

## Project build by Samuel Villaescusa Vinader(samuelvv22@gmail.com)

### How to build project

 - Built in Ubuntu 14.04.5 LTS
 - Using Ruby 2.3.1 version.
 - Rails 5.1.4 version

 #### Steps to run project:
  - Need to install all the esentials for rails (nodejs, libxml2 etc)
  - Also mysql needed -> `gem install mysql2`

 #### Steps to build database:
  - First, you will need `mysql` server --> `service mysql start`
  - Create a new database named `the_good_pizza`.
  - Then, you will be able to do `mysql -u root`. If you type `show databases`,
    you will be able to see project one (`the_good_pizza`).
  - Access it by typing `use the_good_pizza`.
  - By making a rails migration `bundle exec rails db:migrate` you will get
    all the tables needed to work.

Then run the server using `spring` --> `bundle exec spring rails server`

You should have it running in `localhost:3000`

PD: Added deployment script. Don't know if it will work, because
    i built it pretty fast to start the project.


