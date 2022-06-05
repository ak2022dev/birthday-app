# in app.rb

require 'sinatra'

get '/' do
  erb(:index)
end

post '/output' do
  @name = params[:user_name]
  puts "@name is #{@name}"
  @bday_day_of_month = params[:day_of_month]
  puts "@bday_day_of_month is #{@bday_day_of_month}"
  @bday_month = params[:month]
  puts "@bday_month is #{@bday_month}"
  erb(:output)
end

