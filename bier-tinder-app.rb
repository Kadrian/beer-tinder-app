require 'sinatra'
require 'yaml'
require 'pry'

get '/' do
  @beers = YAML.load_file('database.yml')
  erb :index
end
