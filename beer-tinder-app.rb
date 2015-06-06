require 'sinatra'
require 'yaml'

get '/' do
  @beers = YAML.load_file('database.yml')
  erb :index
end

get '/statistics' do
  @beers = YAML.load_file('database.yml')
  erb :statistics
end

post '/statistics' do
  # TODO: Read beer name from param and update like/dislike count
  # in database accordingly
end
