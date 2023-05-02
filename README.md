# Golf Lab Project - Team 31
An online golf course creation and management system. Map creators can design default outlines of holes on specific courses. Users may make copies of these default courses and customise them to their needs. 

## Getting Started
### Dependencies
* Ruby 3.1.2
* Rails 7
* PostgreSQL 14
* Jquery
* Jquery-ui
* Leaflet
* Leaflet-draw
* Leaflet-geosearch

### Installing
* Clone the repository
* Ensure the postgresql server is running with `sudo service postgresql start`
* Run `bundle install` to install Ruby dependencies
* Run `yarn install` to install JS dependencies
* Run `rails db:setup` to create the database and seed it with default data
* Run `bundle exec rails s` to start the server
* Run `bin/webpack-dev-server` in another terminal to start the webpack server

### URLs
* The server will be running on `https://localhost:3000`
* If deployed, it will be available on `https://team31.demo5.hut.shefcompsci.org.uk`

### Testing
To run the automated tests, run
`rspec`

## Deployment
The application is deployed on a server hosted by the University of Sheffield. The application is deployed using the epiDeploy gem.
* To deploy, run:
`bundle exec epi_deploy release -d demo`
* To seed the database, run:
`bundle exec cap demo deploy:seed`

** Please look at the `db/seeds.rb` file to see the default users that are added **
