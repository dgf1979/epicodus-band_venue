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

###
##BANDS
#list all
get('/bands') do
  erb(:bands)
end

#show editable instance of
get('/bands/:band_id/edit') do |band_id|
  @band = Band.find(band_id)
  erb(:band_edit)
end

#add new
post('/bands') do
  Band.create(name: params['name'])
  redirect to('/bands')
end

#update/edit
patch('/bands/:band_id/edit') do |band_id|
  band = Band.find(band_id)
  #update venue list
  if params.has_key?('venues')
    band.venues.delete_all
    params['venues'].each do |venue_id|
      band.venues.push(Venue.find(venue_id))
    end
  end
  #update single value fields
  band_updates = Hash.new
  if params.has_key?('name')
    band_updates.store(:name, params['name'])
  end
  unless band_updates.empty?
    band.update(band_updates)
  end
  redirect to("/bands/#{band_id}/edit")
end

#delete
delete('/bands/:band_id/edit') do |band_id|
  Band.find(band_id).destroy
  redirect to('/bands')
end

###
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
