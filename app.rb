require('sinatra')
require("sinatra/activerecord")
require('sinatra/reloader')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "salvation_army_signup_test"})

get '/' do
  erb(:index)
end

post '/volunteer' do
  @name = params["name"]
  @date = params["date"]
  if Volunteer.exists?(date: @date)
    erb(:error)
  else
    @volunteer = Volunteer.new({name: @name, date: @date})
    @volunteer.save
    erb(:success)
  end
end

get '/volunteers' do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get '/volunteers/:id' do
  @volunteer = Volunteer.find(params[:id])
  erb(:volunteer)
end

delete "/volunteers/:id/delete" do
  @volunteer = Volunteer.find(params[:id])
  @volunteer.delete
  redirect "/"
end

get '/about' do
  erb(:about)
end
