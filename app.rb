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
get('/bands') do
  erb(:bands)
end

##VENUES
get('/venues') do
  erb(:venues)
end
