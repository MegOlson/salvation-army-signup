spec/spec_helper.rb
require("rspec")
require("pg")
require("sinatra/activerecord")
require("volunteer")

RSpec.configure do |config|
  config.after(:each) do
    Volunteer.all().each() do |volunteer|
      volunteer.destroy()
    end
  end
end
