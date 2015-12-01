# signup-form-heroku [![Build Status](https://travis-ci.org/nogeek/signup-form-heroku.svg?branch=master)](https://travis-ci.org/nogeek)
An example signup form as a sinatra service ready to deploy onto Heroku
Deploy this service onto Heroku, then create your signup pages (example of which can be found [here](https://github.com/nogeek/static-website-to-s3-example))

## Getting Started
Make sure you have ruby, rubygems and bundler installed
* Clone this project: `git clone https://github.com/nogeek/signup-form-heroku.git`
* Go into the project directory: `cd signup-form-heroku`
* Install bundled gems: `bundle`
* Create a new Heroku app: `heroku create`
* Add Sendgrid (free) to the Heroku app: `heroku addons:create sendgrid:starter`
* Deploy to Heroku `git push heroku master`

## Check it is up
If you are using this in production I'd recommend adding pingdom or some other service to check that the
health check is returning 200 OK. This is here: `https://[your-new-heroku-app].herokuapp.com/health`

## Customisation
You need to change the from and to emails inside `app/signup.rb`. 
The from is the address that a new contact request will come from when it gets sent from Heroku. The to is you personal email address where you want to recieve the new contact requests to. 
You can change these and the just push again to Heroku to redeploy.

## Tests
To run the specs run `bundle exec rspec`



