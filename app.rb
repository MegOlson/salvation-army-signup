require('sinatra')
require("sinatra/activerecord")
require('sinatra/reloader')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "salvation_army_signup_test"})

get('/') do
  @volunteers = Volunteer.all();
  erb(:index)
end

post('/volunteer') do
  @name = params["name"]
  @date = params["date"]
  if !@name.empty? || !@date.empty?
    @volunteer = Volunteer.new({name: @name, date: @date})
    @volunteer.save
  end
  erb(:sucess)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id])
  erb(:volunteer)
end

delete "/volunteers/:id/delete" do
  @volunteer = Volunteer.find(params[:id])
  @volunteer.delete
  redirect "/"
end
