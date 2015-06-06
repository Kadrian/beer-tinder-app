require 'sinatra'
require 'yaml'

get '/' do
  @beers = YAML.load_file('database.yml')
  erb :index
end

get '/statistics' do
  @beers = YAML.load_file('database.yml').sort_by {|b| - b['likes'] + b['dislikes'] }
  erb :statistics
end

get '/statistics/reset' do
  beers = YAML.load_file('database.yml')
  beers.each do |beer|
    beer["likes"] = 0
    beer["dislikes"] = 0
  end
  File.open('database.yml', 'w') {|f| f.write beers.to_yaml }

  redirect '/'
end

post '/statistics' do
  # LOAD
  beers = YAML.load_file('database.yml')

  # MODIFY
  beer = beers.select { |b| b['name'] == params['name'] }
  if beer.empty?
    return
  else
    beer = beer[0]
  end

  if params['action'] == 'like'
    beer['likes'] += 1
  elsif params['action'] == 'dislike'
    beer['dislikes'] += 1
  end

  # STORE
  File.open('database.yml', 'w') {|f| f.write beers.to_yaml }
end
