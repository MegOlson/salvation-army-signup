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

post('/volunteer') do
  @name = params["name"]
  if !@name.empty?
    @volunteer = Volunteer.new({name: @name})
    @volunteer.save
  end
  erb(:sucess)
end

get('/volunteers/:id') do {
  erb()
}
