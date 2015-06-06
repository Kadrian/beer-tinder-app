require 'sinatra'
require 'slim'
require 'yaml'

get '/' do
  db = YAML.load_file('database.yml')
  @beers = db['beers']
  @index = db['index']
  slim :index
end

get '/statistics' do
  @beers = YAML.load_file('database.yml')['beers']
    .sort_by { |b| - b['likes'] + b['dislikes'] }
  p @beers
  slim :statistics
end

get '/statistics/reset' do
  db = YAML.load_file('database.yml')
  db['beers'].each_with_index do |_beer, i|
    db['beers'][i]['likes'] = 0
    db['beers'][i]['dislikes'] = 0
  end
  db['index'] = 0

  File.open('database.yml', 'w') { |f| f.write db.to_yaml }

  redirect '/'
end

post '/statistics' do
  # LOAD
  beers = YAML.load_file('database.yml')

  # MODIFY
  index = params['name'].to_i
  beer = beers['beers'][index]
  return if beer.nil?

  beers['index'] = index

  if params['action'] == 'like'
    beer['likes'] += 1
  elsif params['action'] == 'dislike'
    beer['dislikes'] += 1
  end

  # STORE
  File.open('database.yml', 'w') { |f| f.write beers.to_yaml }
end
