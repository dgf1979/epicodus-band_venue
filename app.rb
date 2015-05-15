require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/test') do
  @test_var = 'Sinatra OK'
  @db = "ActiveRecord Using: #{ActiveRecord::Base.connection_config[:database].upcase}"
  erb(:test)
  #redirect to('/')
end

get('/') do
  erb(:index)
end

##BANDS
#list all
get('/bands') do
  erb(:bands)
end

#add new
post('/bands') do
  Band.create(name: params['name'])
  redirect to('/bands')
end

##VENUES
#list all
get('/venues') do
  erb(:venues)
end

#add new
post('/venues') do
  Venue.create(name: params['name'])
  redirect to('/venues')
end
