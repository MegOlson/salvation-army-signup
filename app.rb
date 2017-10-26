require('sinatra')
require("sinatra/activerecord")
require('sinatra/reloader')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "salvation_army_signup_test"})

get('/') do
  @volunteers = Volunteer.all();
  erb(:index)
end

post('/') do
  @volunteers = Volunteer.all();
  erb(:success)
end
