require('spec_helper')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Sinatra framework check', { :type => :feature }) do
  it('verifies basic routing and view setup') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end

describe('Application Testing:', { :type => :feature }) do

  describe('Band:') do
    it('lists all bands') do
      band1 = Band.create(name: 'The fabulous stains')
      band2 = Band.create(name: 'Hootie and the Blowfish')
      visit('/bands')
      expect(page).to have_content(band1.name)
      expect(page).to have_content(band2.name)
    end
  end

  describe('Venue:') do
    it('lists all bands') do
      venue1 = Band.create(name: 'The Greek')
      venue2 = Band.create(name: 'Woodstock')
      visit('/bands')
      expect(page).to have_content(venue1.name)
      expect(page).to have_content(venue2.name)
    end
  end

end
